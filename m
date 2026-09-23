Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7FF516179
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167595; cv=none; b=DZlaZIekfDFdw/d0hX5AAwNoXOUryDIYUZGNwpZntViW2R+nFGq9X0tFc2WwNan7dhG+r2Tc8ucWSVk3tH1RVew8WGsGaYrDn2+A0C5CLuLnKBfoP5WROyJ0sPS4yJo3SRtX4QL3tD5LhaEmlm3Nc62IwD8hTI/oMurLosL6ODA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167595; c=relaxed/simple;
	bh=Ohg024+Cwlt++FmvFw5EsGbK5xGhjo6gLr18p/3L44U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N2bK+boCOFpVmxwOd/PqSbOmaE2BqxQ5QsxXSCOBOhUYI5T51IVSv+u8r7rEJJ/C+7LyCgEC25n2HdEtSwYGeVdafsP1bbjVTpm7kop9OWPJQ5BlWWymsJyj7P4Km7pohHzbwuma1PprvDYrxo8K2L1vc/USsiBt3eD5s+95FSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=owZ25EjC; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="owZ25EjC"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39e3dad7ab3so829707a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790167593; x=1790772393; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=muv7UaFF6SrrvDWlwqcxVk2jjQ83NyZ7lpGrl+Ib/C0=;
        b=owZ25EjCYK3ec0rtfd+p4equkhSkf+4+tGEI8kzOay53/psgR+6WntI56MA3u+f+XD
         +5Xc2dGPgT0cw5681D5XFm4VSJ2O72Gujh7sd4iwiEIoUuBDQPAF1oQX2XKTX/6nI3mw
         QbEMs2ytGJr8svDjqjnES2637NWW8D+PVXLwzeRxGR+HvfWK4evIr8w6rWHAc7DNXXri
         SZsTkPAXypETxjkMBlsX7GKwXV0obaJtWvIc16ASZYsSOh6fQtaOH6JO7SmJm1PE37x+
         Hb63DI5eu6UKefO5bG5wmOrpjhNJGMyVyrSmGi0JZm5TcXSMa2qGil/hiGH7FhkiJl40
         kCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167593; x=1790772393;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=muv7UaFF6SrrvDWlwqcxVk2jjQ83NyZ7lpGrl+Ib/C0=;
        b=ULf46ZM294RIhH01osjNZSTkF3nZYFTu0OoPUdupiksh+EnXfF5eKGO1irNiLVSMo3
         jql8+fWXjqXSL5ZrNy3FCMkG3l14T6KDYB+LmnpHM8sUbHXK92pZ9Ab+gLR46Y4cKq/C
         mcQBIhlOik7N3/IOLi7yCDtPpjMsQrqawbwU6OZ0m3YDS2mRAlb3au/iEqiZK9KgPGAH
         ADrIwSI9LFHSH5Lll/3tQYbN4UHam8gDVHo9BztyrfltnpdpgQToEFvaXvhuqAiUnGtM
         HmCEM56ApFTQkbo8T3pPzuzsjk/9WyGeYjk6rLDZ7HNkQOdcrRjANfLWeRXap7HJrLxa
         lFTw==
X-Forwarded-Encrypted: i=1; AKwUvBziBG4SVMQt910WVqeBbkOXF6KNzHtsUECW7jh4HTH8Zmn3cb/yLYagpu8qHFBowf69+Clul9hWvd2Pmuk=@vger.kernel.org
X-Gm-Message-State: AFuF++lMrbbtgNC86x/OVO3xt4ooS23O/eqmXigp7gTywLfcWHgclWHZ
	+dKhH0oUFYB1AxxY1+g7gptX1k8327f0OENQ4JN4s7/yMv9cpkx2vF93b/o29rF+5s4RrVC4wx+
	DXfrOtg==
X-Received: from pjsa5.prod.google.com ([2002:a17:90a:be05:b0:3a0:87bc:37f5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:38cc:b0:39e:5166:df84
 with SMTP id 98e67ed59e1d1-3a07e51cc4bmr2333974a91.16.1790167592649; Wed, 23
 Sep 2026 05:46:32 -0700 (PDT)
Date: Wed, 23 Sep 2026 05:46:30 -0700
In-Reply-To: <8edfb868bcabfef8e2dee96c0831cc3f1234367e.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260921235656.1107929-1-seanjc@google.com> <8edfb868bcabfef8e2dee96c0831cc3f1234367e.camel@intel.com>
Message-ID: <arPJeqU-kWzFdOu8@google.com>
Subject: Re: [PATCH] KVM: VMX: Formally define KVM's "0xdead" exit reason used
 for failed VM-Enter
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Sep 23, 2026, Rick P Edgecombe wrote:
> On Mon, 2026-09-21 at 16:56 -0700, Sean Christopherson wrote:
> > Add EXIT_REASON_UNDEFINED to track KVM's magic "0xdead" value that's used
> > to stuff the exit reason on a failed VM-Enter so that the magic can be
> > reused by TDX, and to make it more obvious that it's an arbitrary, KVM-
> > defined value (though the whole "dead" thing makes it pretty darn obvious).
> > 
> > Opportunistically add a compile-time assert to ensure the KVM-defined exit
> > reason never collides with a "real" exit reason.
> > 
> > No functional change intended.
> > 
> > Cc: Xiaoyao Li <xiaoyao.li@intel.com>
> > Cc: Yan Zhao <yan.y.zhao@intel.com>
> > Cc: Binbin Wu <binbin.wu@linux.intel.com>
> > Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
> 
> > Cc: stable@vger.kernel.org
> 
> ?? To help the backport of the DOS stuff? Seems strange: "no functional change
> intended, CC stable"

Yep, I massaged two of those patches ("thanks" incoming soon) to yield:

  KVM: TDX: Stuff exit_reason with UNDEFINED on wait_for_sept_zap return
  KVM: TDX: Set bits 31:16 to 0 and use UNDEFINED when synthesizing exit reason
