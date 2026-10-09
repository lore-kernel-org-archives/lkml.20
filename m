Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2773D34BC
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791580432; cv=none; b=pFo/aRI/jALk4qi2xRIz2rbVcjqoN/lYdvEKuZsFTtKi+AaOjmgaG2d/NTnyVe2YzE9t5gDtuKk/EN5AsDnQ2Tq8FYtoe2l9BizAxNhM3zahBJhOuUdOs/zFyWsTrWT7tucThRgfrHcQSbWgUc/f6ZDFU0M/FYpllL5LrfmJ6ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791580432; c=relaxed/simple;
	bh=f2/MICLCErTodlF6SfyHDMCXCSRgLawKzwcMBFedg/0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Nc7gSziz3V0RULms+0se5QL/swXK5myzZvjeRPqAjdTtMbNpB+HkPMxMKPsaZOvHn3J5hYargCRADdA/t3NuwAAFBYQcXSFFiY2W4EcMTGm1YzG/WYhk4zSX/VpDo2Dk/qf/nvx4X/sObaKm9yNatiNZkttUjMSIaMTdQZQ5WI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ubI5L0GP; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ubI5L0GP"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfc52ddc55so1430565ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791580431; x=1792185231; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f2/MICLCErTodlF6SfyHDMCXCSRgLawKzwcMBFedg/0=;
        b=ubI5L0GPFSQwrzWccGT9khVWqh5E++pF0JOt4x4YirBubEqEieyrA++qcWW2hnartk
         doBCCNuhzkDbL6Ij3DvAD9qGPZKLHaWSREY0E9/OYcWTL5Uca+YUpg4U6X8sV0+mVWwc
         B184VeLSE/nr8iMVnV8SCSsXR2nSN4F8DYnzpnLkscqf6yj0BBJsH+8H/Tl04O/tIIvm
         FZ+4RQ5KDCnwdCPXayLnB1HlX19XXxTtIUqv6vf3UWMb6zdSNcvMQcmJCKfwIc5XtKGC
         41g3GfVWKhHAJkvGQPSqGiMefvzdpxWM7rpZGGOSUFFD1aaCE4u7XOU3+ISLtAvg90en
         uB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791580431; x=1792185231;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f2/MICLCErTodlF6SfyHDMCXCSRgLawKzwcMBFedg/0=;
        b=v2pXZR1htLGJ5CsrW1CavPNkzh55oJgbQlCvn3s7cdWjc2NvvI3fC95ljix3Kz6ZeH
         fIFr9mXsO5ShBmogYIB8XyPaHz9xj4EJbV60UU0yf/15eOr9VP4mA87rBMRCp4TAu8S1
         H4paC9ZfqtUoDBFjFDDPBW6TP5ryJNS+6IVP46XUuG/8XbM9hBvK3VTqqMm1PFi6Ap3L
         Se9y18GeOwr9vSTQFZVYwqEBiZtnySolIfPksG2iVv8lpoZLz1ApjplPA2EwRaUey5LQ
         PjOSvwgUr0bHOkV2lJnX9ZqYStNj2B95bmYB3EnJTls4EpywL2BHKkw5ct/L9OTSmYVC
         lt8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzwGWVXB4iVqlfR0XE+uD3YW+48YjxScA06Q/wZFgXGR/l+4BK6a0NYse4laOd68Rv14fsbDPn0SvS27Tc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcL6XvGmY46Co/V94WbhZMB+murnENt9uh8C6Rb1i4nJmib7br
	gk5BUZhZEHxirNeoBxVP31nm5RxGX0jnS6dPyVrNQ25uR/dgvDnHtREhNp/s42UfjfvV6fFK2wS
	VVjlglA==
X-Received: from plri10.prod.google.com ([2002:a17:903:32ca:b0:2e5:9357:4fc1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e849:b0:2e8:4ef1:6fd8
 with SMTP id d9443c01a7336-2e84ef177e6mr20615815ad.60.1791580430759; Fri, 09
 Oct 2026 14:13:50 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  9 Oct 2026 14:13:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261009211349.112524-1-seanjc@google.com>
Subject: [ANNOUNCE] PUCK Agenda - 2026.10.14 and 2026.10.21 - CANCELED
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

PUCK is canceled for the next two weeks as I'll be offline/traveling.
