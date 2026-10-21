Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792592814;
	b=tmsRwQhYeFi+xkEqS6jixTBCOhLi0C4zUdqajVjPV7mkv+li1iSoJTT0KmEm0kA3ooE9
	 AZ8DOnB8fuoQjflRECGHZHrq5CzL2UZWKiFoqb7hWmM8ajW2yleNsJQIkXWgCqZ/Mqr6m
	 JlW4l/zv9Vf3jYseMgrdEaSeXHOnzsMF6+HT+tLBn87PsWIpMTB3tJPx+JRNTMGbCb3Qm
	 1D0S86KWJ+nFOBGLVrFs8NJk/foUY4Cy/eo3+FY5HLEUCMNWRTNDVKGQBKw3v+xcWu6G4
	 NRkdsYPb5sn+8ZPX9at0lH19rNSnfr/AnV+TogoNSpsoCDUXXd8We5i+bQr/XlibEiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=HZWCDTWe8myvVLhLnC3gRwnDw2Z9dfDRU9KvUScIux8=;
	b=VQCntp9xhVGfNcTbKecV3aBVSaUbR/TK3ESFUWtZY6P3PW2unAAapp3fCR9YOajuCJW8
	 bH06WInPollxQBDkamQk78RHntIvteL/KJvn5ncZkgIPCfdQ/secgKzGXP77TJUosuLVm
	 01+bpGxJ9YvEVwbMpnrcsIUa84o2u3+LmixtOA516a2IrKErDnkbeLjMDOS5Dw2WdKlUh
	 9qm+sGNs4U4FM//MjqcOcvaIsGQOX4/ELkz8eiiVpZepYBc9utIgwPp2QSfV1t+w39CKx
	 FAL4xZKUM4hRSdYdjgbF0wKVq9CIHMVSy7xDOaKGTEb50DVMDgYI5EHUKjvXRLLIBSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BRqHAhOJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEE9606A325
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:26:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FEE9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BRqHAhOJ
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c418e215671so100591166b.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792592812; cv=none;
        d=google.com; s=arc-20260327;
        b=tCNTlI4K1JPsvnwzhfF9g4bl+Ju4vUWYQCwI7nB315sSZ1dWSHrn9Vf5JdET+c8jbd
         N9g0NNP5kxJRYMiLZQ96nF5Jlkb1iu3thToe/xIkrVl/W7CDdtxkB4ewK2v4/HTJ9XgO
         7dm50cvg2HmueYMsb6sAk3+V38t1N99g5JLuNPVFfew0l2mLFgG7D/fCTbYd/SOKoWSe
         dTmGlSQkLqhsHgc3Ot/g+M3Ly4/actUWyeSkP3a7yDCxWMYe7Vl5zGRfx0fxjgmJfg6e
         XcNLlAeahupasSgS7Hq1dr3mhEeMRJuCFp2yo9JJ8iQ0/hpDOT9TDWxrKZRRaUDuS5mf
         zEZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HZWCDTWe8myvVLhLnC3gRwnDw2Z9dfDRU9KvUScIux8=;
        fh=OMbVcgHKbiTXWKq+Bd2EqRCFK8PajIZ6g6tecOcIe/Y=;
        b=Mut0Zpmlvb8l2lBh2iLe7/JqIwQ0yAwrdVCj9hBcVr6qAHzB6yNNxlQsRwkiGQ4xMS
         bwa59up4DRkbPjY8Savn31Ye3ls3rrenLna/obzKykzNn1PH0zc4kc0VwtuDIErDEd7K
         dyoc0tgR1M1DtS7bAf15/5CPkGn7Q/e4VyKuPcxbQJFQeDf0CF5JDcS/GjDXrT8Z2JVT
         1G9Oyb4WXgPk2OYG4cNMGm6CXu4JkVKebd3fua4to1zKbJYVQcPL0fRFji4xwQrhNtNc
         ky1sd0XGaq3eFXO0R1913bdri+CQBeFUZoh+9Tz4+UOx8btTMsC9gWuJai6OLF/A3roa
         AbCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792592812; x=1793197612; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZWCDTWe8myvVLhLnC3gRwnDw2Z9dfDRU9KvUScIux8=;
        b=BRqHAhOJRFQGCZ0436cerbXsvDGcjOTtcEFCOpJRV+nbVKbSAKMl662tBLFTfb2Sg5
         NFxQNyHoxxgYHQR13h13k71ankQp/N0fxgwfPZdFZZwD0LZwBvhOQiky2tnvBNcGVE92
         vpRJ7hzp6lhKrZveGyDGkQ94JZjS5rrim4/SQCOenhyqo5st97RuKWVFwTkWZQ5bTbIw
         iWX7FjROAHIvHplEaKREmJYGpSp7sUQFKLAPhXVjYlSpM8WQnUK4iSviJf2DCzgxJwf5
         mmlBS+ISZT3vDsrX9Xx3+f3KYgz6TnHUVdIwJP9bY9OfNIdfJdTh5lFsIo+qwhCRzOmH
         nAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592812; x=1793197612;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HZWCDTWe8myvVLhLnC3gRwnDw2Z9dfDRU9KvUScIux8=;
        b=FftSkd1cAeA80KGMWBTXvafMdPgWxigC/VD7KPRXJNsdlWRsp6K4jPXGe+8S8tbNl/
         6g5MfoMXX4iDfr9iFCFCG4SVmPL1sQNnXcLweZWZ2Wb9vnQPR2gD/vhYxTOVJlbhaf02
         IgLwMIvVTfqc2GXVYwIP0QYrLoMYAfUoGLf9TX1LqIsaluDWfETu8lgiwgCdITkFNCwI
         99nLQzOYVfNp9rKJFyjRpHgwfdCvq+51vnXrpriw8boFbsuI5SXnH1gYf3j9gKRUxi5e
         r/SE7WEJFX6U+hQwyWNdMfUFaRpfWtGA7dfo6k6DQdkMVkzDNOdLTi2sPA2AjfSs9taj
         cWxQ==
X-Forwarded-Encrypted: i=1; AKwUvBz58jm3LH3Yd523uPdJwSC/Ts/1ZNvEe3c/yLpk/+V766XJIPk98GuJnL/1UsPzdUcqKva/b0oMuSnjyMs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKt9XtuUO0cLeP1H/CrbmC8cS5KuCw8QwxlbhGEpnjnsZeTR15z
	366yKQabMSkEkQjeZ60ycjef0ghG9eF5wtQps6gBcogJO6jKNvNFL4nKnlFuRD66fH2Ow+BoY+9
	YTpk2EJ+SWWGJ+qWC9VPOX5qn5bTCYK4=
X-Gm-Gg: AYBFou0c3GquTe3SE1TOAVA7OMQFdrfeQ5hh9M0p79k1y+NOJZJrtMXAOJ14QyIkLtj
	4128iQbV7X0GmRvuZG9OsL5yvtebglXLs3LwWuIQDL2++FSdX+2vyPRC/LUUbJ22HGrsLi/Kzoy
	u+d+h0auXos6EbOQMmW/q1VbX/RHxhZawHXOmCijJ1Ur6woyyrJOLxGgWPf4MOc5KhF97iWzYzg
	s98Z14CYpp/ZEnvk3Or2dQbCOZuKxNmYEq91YIzEYbgJcXQ4Z+vYztIW1wltGQy2CbmrZGQmn9k
	7mxla564zrx+lXdNVd0CINkdJFCVCU1Hik9wJtvK2LOIQO2q2JgGN5WxPp8HQ/9LxtuotA30gnQ
	qHow9ve7Id+hhlHadXvUv05Q9IVdTQMahLFy6
X-Received: by 2002:a17:906:c105:b0:c33:ca5e:8ddb with SMTP id
 a640c23a62f3a-c46796b58cdmr190770166b.28.1792592812271; Wed, 21 Oct 2026
 07:26:52 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792552161.git.jan.koester@tuxist.de>
In-Reply-To: <cover.1792552161.git.jan.koester@tuxist.de>
From: Lionel Cons <lionelcons1972@gmail.com>
Date: Wed, 21 Oct 2026 16:26:15 +0200
X-Gm-Features: AclHuK9oo5ZYObAiFZur0ih7xDKEBxlKdO-BvoDx6w0mXhpoTx1_PdEXJcogV54
Message-ID: <CAPJSo4UJPnhLFAYRXE-_M2_Nin6=Ff02AjayD10cB7946MvJDQ@mail.gmail.com>
Subject: Adding dreaded Windows SID-style, or. Repeating history, the bad
 chapters. UUID/GUIDRe: [RFC PATCH v2 00/41] UUID and GUID user and group ids
 (*_r system calls)
To: Jan Koester <jan.koester@tuxist.de>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Jan Kara <jack@suse.cz>, "Theodore Y. Ts'o" <tytso@mit.edu>, 
	Paul Moore <paul@paul-moore.com>, Arnd Bergmann <arnd@arndb.de>, linux-fsdevel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-nfs <linux-nfs@vger.kernel.org>, linux-cifs@vger.kernel.org, 
	netdev@vger.kernel.org, audit@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 at 13:24, Jan Koester <jan.koester@tuxist.de> wrote:
>
> Hi,
>
> this RFC series lets a user or group id be a UUID (RFC 9562, version 4)
> or a Microsoft GUID as well as a classic 32-bit number. Processes can run
> as such a user, files can be owned by one, and credentials, ACLs, keys,
> System V IPC, sockets, signals, audit and procfs carry the whole id.

Are you Linnux guys aware that this is just a variation of the
*DREADED* Windows SID that this patch tries to introduce, just with a
new name?
Maybe, before doing this, read about Windows SIDs, and why they are so hated.

Secondly, the whole idea of doing 128bit hashes as UUID is not new,
IBM DFS had it, and had many iterations of security issues via hash
collision exploits. 40 years later all this horror comes back. Does
history really have to repeat itself?

Lionel
