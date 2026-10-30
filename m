Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347107;
	b=oiVOq3Oqc+QKJpkfE7iApA3znRTSrr0IGmpaG0Oqdc08DN78GvBNpBMlh6NjN32gaFVw
	 bWK8rieJ2BwOY+/n4idz8bWTwOeYaIQdOgHkMUXyqeb9mmrVHZLnSU/XEXjO0dfKnnrwl
	 R/FNxZbJRla1NSxZtrivB3GHocsccZARqHvBsS5syHxRlEOFeIB1HqUB1CCugHXaJ7i8P
	 6r4TkEc3xPA/QaF4+ldpuYWwmcheCkLzEF+YSicuhOy2HDYSOE++GsRmMDO+A8esL+wym
	 4oEvY0kPY0Ob4N+UHfkxF3ThlvM11FMWRFQBNEEkSGbw3ogPJLDLLbyonwyztR5XHKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4oAI5pxrIzXlsyWd5vlHzyNWwBTG6cTZg/AYjzhaORc=;
	b=BR2KAXeV2EhWQEhLQcbaxC0mxs5OKSclvkjJA6nqiSo7tYh3JP2qRvevZGYWP9MoPWau
	 IFJiXznOkN4mG5wvpjl5VMhzlmPH36wfGCRP+cYxnLNNBkynJr5rFFxreqmvTsBmImhL8
	 yBPrB5Ofm0nuiTo87jjXE27W5xxlOnQ1RbRKarFBnCE0ZfYiH4aAClTBmMhrtenvPVKTM
	 eMAC0B0JxM9p0BqHlohNuW+fRZ/6bDc2iHz+lJksnsTWriNVGBDdU6KFLuc8gsai5EQoJ
	 DtXI6+6XYr+1RdFgetNJXiwpElpXHqihTffmICcvPo/T3CUMglHhc1S5pImojZU+97A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GGG9vEBq;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C266606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C266606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GGG9vEBq
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36a1947498bso1117680eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793347106; x=1793951906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4oAI5pxrIzXlsyWd5vlHzyNWwBTG6cTZg/AYjzhaORc=;
        b=GGG9vEBqs0KOdgWpmiKWSIt5WiVXa1uTTSIYJDfkXZTot6gliH6IsN1uuFr/2jrYSe
         U7gllHE3EA+ogniCMpvqYCrZN9iykitU4bK2wKXp4ARtTJbW4ms7vkhdADyORj/ycI4H
         G3KACOujmEYbJHeu0gTiGhwGYcg2b9X5IqEJNEM4MxjkgfcZchN3kL1bz+lINiJNWIzF
         zGgqY6RUWYac/JAXO9F5JJ5jYRt0FVaae8UP7FlSjNNhD9m+UFZLz733RHavNFzFPDPQ
         dueoDefL4Rlbv0MJcoOBr6BADn6WW6jesglLMWLzYPkxnwbyC7onuwK313uY5FSCt3SH
         SFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793347106; x=1793951906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4oAI5pxrIzXlsyWd5vlHzyNWwBTG6cTZg/AYjzhaORc=;
        b=YzW5O2rAM9rk/gMki1iHPoD/O4iGp6rvO0O/tBhwQ4xewMRINfDNYPTR72N2f0g75U
         KztStHTZ5d3M6fMEEs/k5k5i9ygrm3fiBKJSMLiiuMgHHKYleMTBTZpFKf4jtMvCkbJv
         gfOy8FMNzHZcMkpN/hcPQNN4617xyDBL+wsOcBYvZQTmZrTtxSAu5bqCc7OBDESlzndO
         Corduo+teE31f5jTFuLxJGERGjixVAJ/xkjvwIWiz9Bjo7VBx01aBUNHDmrl5zxBEMZJ
         iUM02vzJ2xLWPP+p+z3eeycRD8WtdeYE0C2JC4/u+pPBXifMFhqeU6aLxLG/Pbdr5c8r
         jW9g==
X-Forwarded-Encrypted: i=1; AKwUvBx8KXMwteXvaXDZT0NFOqDJg0gPHMdJRtxHqiZCZqXU5/B85FPq13M7+La5aPkCLqSmNuSUy3T6sEevdgw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2drQ8NgY1REIyvv8DryXYj071BlE+nnPZAu20QPB1mCpoMoCL
	QAmi3j2PMITEO76zTlicdQi2ULDWX14gxs8VR4DkeSHAJaehBeRzO30ZbmKYBhLD
X-Gm-Gg: AYBFou2ftnbUOhS6zX0KHhTYe3NlT7B63kMxMdxUv8w3ZhSaMHKggqSvrfQRtzbs5nH
	qenWs2Di1EwoXwR+xYBGuJDyeSVYwJx+K/YymYa8MQmfmCUBLq9m+mWbiIOixxQtidQ2gk5w5pI
	ZuXiiFBV5I8KABKg4//G6wnT92s9NT25uaLAv0qX6TCe/OgLET/CU0+KVilmopoH3PPpr3coRl0
	ifZp1Mdc//xxGIFpwR9IaJxNsMD7YkBu1cetDVWzNlPeCMiqhlX5KAQRq12q38V+amDzUoS+8bx
	O9bq1q0AK1FUskRHCX61mii+NbkPvnMNJz1PB4k2zzaMq0/2yRFZ86+2pkK4jQSRRC3kHjGfW5n
	WRxzpMT1oEn8gaTg06n9qQXINasAZY9fe6ci4ey+QJcyiOwN+AEsGUktZFp2RooZHcdemEPpxv6
	lPv17fCI/cpbcGW3imIjic9w+2EAuKLlpO2CtHmFj2W6yuk4tKbpOnNSMKsSSfyHmyj0gPPdSxB
	c//1qKZ9OTXpW/D20zzP4+rkqur3O6sRuVKRaDy+1BhUPJ+B6Sa4Lqj19/E0CmNmgWtiPupjjNq
	Haq+sovKgqnHgkSdo/kuxP39tdMRYd37Y3vJ5LJdFxAT2Ndgb/Ybqqo+HUofDfjeI3g=
X-Received: by 2002:a05:7023:d0b:b0:1a7:216d:157c with SMTP id a92af1059eb24-1ac5de5380emr2405354c88.34.1793347106204;
        Fri, 30 Oct 2026 00:58:26 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm4741054c88.14.2026.10.30.00.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:58:25 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: gregkh@linuxfoundation.org
Cc: jirislaby@kernel.org,
	dmitry.torokhov@gmail.com,
	mathieu.poirier@linaro.org,
	linux-serial@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH v4 1/2] tty: sysrq: don't expose a partially written reset_seq
Date: Fri, 30 Oct 2026 15:58:20 +0800
Message-ID: <20261030075820.207049-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026103014-sketch-headed-2fd1@gregkh>
References: <2026103014-sketch-headed-2fd1@gregkh>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

On Fri, Oct 30, 2026 at 08:02:30AM +0100, Greg KH wrote:
> I still don't understand what the root problem is here, sorry.

Each keyboard keeps its own copy of reset_seq.  It rebuilds the copy on
the first key press after the parameter changes, and it rebuilds it
wrong in two ways.

1) It adds the new keys to the old copy instead of replacing it (2/2):

  echo 56,29,111 > /sys/module/sysrq/parameters/reset_seq # Alt+Ctrl+Del
  (press any key)
  echo 59,60 > /sys/module/sysrq/parameters/reset_seq     # F1+F2

Now F1+F2 does nothing.  Only holding all five keys resets.  So setting
reset_seq once works, but changing it later does not.

2) It can rebuild the copy while the write is half done (1/2).  The
write stores the keys one at a time, and the keyboard may read the list
in between:

  echo 59,60 > reset_seq
    store 59
                      <- F1 pressed: keyboard reads "59" as the sequence
    store 60

On a keyboard that has not used a reset sequence before, or on any
keyboard once 2/2 is applied, that F1 press completes the one-key
sequence and reboots the machine.  The window is microseconds; I only
hit it with an added delay.

If you want this fixed, I'll send a v5 with a much smaller 1/2, plain
changelogs, and the Assisted-by: tag I should have added from the
start.  Otherwise please drop it.

Thanks,
Zhan Xusheng
