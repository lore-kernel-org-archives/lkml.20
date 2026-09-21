Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9224A43E4
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999640; cv=none; b=Opz7S9FX1p8neQMlRhCPta08DagFbs3wS7XqMo1aJlGqAHxF1GUv3HuDv9RB8xkPktm1XAqkG9J+HOfIaEgsLGVh118wr41zhzSipE1NuthITa+7cSYvOovSCSxXT35OhhMlgzR/rn1Al2LR2qpIXHBCYanfzlAawaCJ+aKM4+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999640; c=relaxed/simple;
	bh=KOZ0qB47P1ewJ3LD1bSwEcoCVnsnJF9mDPIxaNxavec=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ABj21AskoV250vX1hv9X5bsD2Cpcrh2AKZF9Q9RaBiViWFC6oqt6jSCUE9zcLYBPPp1WtnVULLIDQnqHFzBOa0y65fNm02UzPnqClq4lj9b/8Upkmp70yvze63zdLSRObNzPHOpAJqkcntiDiYlw2r0uk+EmLAO12+q6FBa9KPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l51VD1oX; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l51VD1oX"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-869b8d63e28so4399748b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999639; x=1790604439; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2sMdkQ+BjHAUqyEvlsX1t+uQj30MsWabMHW4ps8eLKs=;
        b=l51VD1oX/m5tikehhVOkm+H0av9N+v099hDBXLuH2uyq/HXlNz3c9xkgjWQ5exqUXm
         3Fv1cAZxqEsDrIUvkkkE0zjDHMXR9KlW/yjAZ/DGQ1EiWD6HRmL57q5wLZKFq/IJgexL
         tUf40kE8PtPpCqyTrJhZqu4aQr0Uoa8mQFBVLVLohF4RDv63LMy7HbBf4jRX5P+bpSur
         B2zm8LRsD9PcKwUIEr9yprZEImU0pWHrSvDiQZRuI2lg7ZtVJSxefEU+wlLESOCrtWlg
         +WTwjXgZ4aMkQ4eKCVJQL7kDJRKpBRp6tg8FmX0QwJs8b9VNwJ7HrpSNPcEq35TR+GZE
         lPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999639; x=1790604439;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2sMdkQ+BjHAUqyEvlsX1t+uQj30MsWabMHW4ps8eLKs=;
        b=GX2t+AqeA9JOE6N8HHiz2IcqBg/sQKLPJlZRVD7fwBibLfXnAqnk6thEiI9JE5KRSv
         cVmeaDMvDsFGuQFQtVqWJW06hzJMkQmut9qqJAjRDNKfTbnXYb+fXYF4secKv5UavtER
         ndN36LYay8eXwyUIxecKHItg+x1hs/ocKwvCj4Zd3T0dkfjTUcLKaup0tW/Gry3cE0f9
         m46GRpaKcyUIBLoUu1wNSKxeGCwkxej+CRlzjIr0jqkT8et4LkV9fY0WOcRcl+OgXo01
         hGuOpJ+wLtu/+kIkDjLM1gLNpV+mEMs+NCmNPfSua5HW2TOHxkPUEzBy6mLvkBPVOkJf
         BM2A==
X-Forwarded-Encrypted: i=1; AKwUvBwAtIRDXengiac37yKPPq5Az+DM785caehm7NWe9S9bpUikZ2UH1wbmMKm9HyZwBzWN/NRNaG/h4MIbPwA=@vger.kernel.org
X-Gm-Message-State: AFuF++nUWugGYvv+XdWyy3l6v5SerX1I5LnC2ScPeaSva3OWrSKzTDXN
	WREyHA18Ph7OzBdMdkwUk9OBBNsQ4TYDohG2SuPi9FjkWXl31vjAejDSXELl0ck9xfOItTMfPLf
	lsT72Rg==
X-Received: from pfkh29.prod.google.com ([2002:a05:6a00:1d:b0:878:7d16:4125])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:4049:b0:3da:c10c:6aa6
 with SMTP id adf61e73a8af0-3dd8c2dc837mr19064460637.1.1789999638674; Mon, 21
 Sep 2026 07:07:18 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:05:30 -0700
In-Reply-To: <20260808061934.400892-1-gokul02k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260808061934.400892-1-gokul02k@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <178999927506.754839.13676560116435386306.b4-ty@google.com>
Subject: Re: [PATCH] KVM: selftests: Fix the bounds of the SEV debug dst
 buffer check
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Gokul K <gokul02k@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, 08 Aug 2026 11:49:34 +0530, Gokul K wrote:
> validate_dst() is passed a starting offset and a byte count, but bounds
> its loop with "i < nr_bytes", comparing the offset against the count
> rather than against offset + nr_bytes.  Only calls that pass offset 0
> check the region they were asked to check.  Every other call checks too
> few bytes, and any call whose offset is >= the count returns without
> checking anything at all.
> 
> [...]

Applied to kvm-x86 selftests, thanks!

[1/1] KVM: selftests: Fix the bounds of the SEV debug dst buffer check
      https://github.com/kvm-x86/linux/commit/622a09f6deb5

--
https://github.com/kvm-x86/linux/tree/next
