Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793381910;
	b=XJv+B3O/7fzZ/o9zjUmbJus5ILqKEjMQ9D5KdF40ANF4a5dUKYqrNGpbgwXrOmhVuyEn
	 R9PK2nbvgQk8LGkjV/Ih9baT1cJBfevU9nXkB63CyUbMkkNScaw3MHhDFpJSrT7q8hw95
	 Nyce+z8v89b8FNzh1QXf04jElN0orOdRLs/2pCq4EKI+jTV4VlH7+KpiVD0N3peCtuT1A
	 6bgXkpeD1Qtox6jQ801pWemnlaFjF1nG/MHCnRH9BFka7/1e7emsYCy9fS1dDkekz2XW+
	 iGiZO0laaSh48w7nJOvIAAADqS6r728q0s0/cHYhEEwed5erROJ+uaPdbCpLuQCiYZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793381910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=EoW6Fc+Q4vJcb/scjylrIakaVWrk6eQ7R0akCKO3swU=;
	b=DeYHuQqbrHadHczQcnSPKztCkJkJX9tvsiHevIN1cX1xibFXHoTO7mTeRKfHq/Xub0GO
	 SHA0a23XjpM6XWjZCkhoS94/Uj7nP9rnG+029B9FHlmIy5LsZ1jVwFLKaMHR2ZyOHzwCi
	 MeewHN+OAkLcel0KXTCgBch1wCGCpZ1cBhsWXbj/IhNUOQ6VQJvBVblNOE0Dmv4dUomna
	 O+hUtuzaVTq9vYtusB3rMWKmn6kjQs+8qBL6vgeQNB5qP2ZR730V7MfvDxe3Klh9PTxLN
	 QOqGG9SNnQxqHvV1VFCRox9JuldREuUHd8sPSszXIQVGdu0wUa/Sf5mupwfZ/f5p7Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XQouLIkm;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13A7606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E13A7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XQouLIkm
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3ae1dca6bc0so630498a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793381909; x=1793986709; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EoW6Fc+Q4vJcb/scjylrIakaVWrk6eQ7R0akCKO3swU=;
        b=XQouLIkmjjIbQtl2AB5ZG9lylmU8nhd4x06gA5H3Dg2o8TGbD91XfJ8zmdKyg6WEQj
         VTNTE856maSNVLT4CiKfaa57Zz+4e/N4R97C4tNY2DtRLOk1rk2MuWOP8+U3aNgXOCjb
         KafuoeCTOUxvtpA8MWYS6qVuAftb+CkbJxUdu1/PamLvCNItdLQicYAfMAlKRTUUCRIg
         Ei7f8+u7lwtZbfXplmb1RS4Hj9pKU1NHpL9N7q+Tg0O+34P7ISWtTFYIu5rWgWhzd8Br
         8oulUFTKjxpAOWH4rKy45/MJHuihRSaaxDx6wfleMHOsocP6+xrjw4enObQ3iNxNq6wI
         +TYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793381909; x=1793986709;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EoW6Fc+Q4vJcb/scjylrIakaVWrk6eQ7R0akCKO3swU=;
        b=RiFZguefUHS0f4ieKc0W0j2PhsnqOhf2XB6pdbHsVPQGsR3TvIF/Zkp1l4/7F7VpQr
         BsClN9bfgffiBY/yurQkBZz6FvuMVOXsCkj5qBMpyD19uV+X987YSt587tia4jlpxr39
         8IxI0O5hIqNRwsgjsJlEf3qnFMgO924OGLgOQyd2FoYx9bC7rf6uZJrPWrR/JF0l4he3
         rYGkLJVT4UxDipECTXmF4gT47un9zzNs0WlNXBwVggS0iyptk0b50Y+8ktSkFwKukP0J
         wKbk5Ukk0mfGrv1NTxNc60Q2vuB2E5oyHpwsWy2hKXOkAw6/jgcTDOfQaRTE/6A4lN6Y
         Zg6Q==
X-Forwarded-Encrypted: i=1; AKwUvByxddGx1q3wXfN6CekFhRZ/KbQRFZZFbyf5akjv0pquslxkHC5I1bDTuNi04B1wV1UEk34lOYY0PJUPF+s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvvF2v5NJW8VN1oToAckAynp18PJC7dK0D4Zf7BpsXwZWUxkaf
	0jrPGeIBzwd4x4yKhzJFK4J14y6b68tqiPVihyuFITn97ieKO8nXMBWE
X-Gm-Gg: AYBFou1UpmZ+xiEzzldtSJVETDwzCiBItgryp/DK4bAeA9KtHP63jjaTqMQHLJl/FZg
	0hKW36PfduydGPM6e2ePyPDJJxjezR/elYVa+be/hftO5CarFxjRGW/bGiF3tpc4angM72yOWfU
	NxruSnmTZM65R0bHriqjsyFAw/OjpknfdMa5V75bgyHakY4x7VxnsmYivblqs85t11djjgrpjpH
	yVHpxihcXfy3RZ3pE+zZwomic9zLCwdWaJSbFa/MDNn/+YHNkUYoH9xi+c/l9m5h+tx/hQbcs6c
	frJELUVf3CkEKJwOrWUN5r+DEQ5oSb6UZNBU2J8Asth9qKKZnfMzJFrIXa8tIi2Gm1BwDFU/CNL
	QeofrqQMqpeircQRwl8sQbIFzNT35bBpp8GDMYy0kWD8lXzp5666nKUsYHEVojRwgTjrX9V0dEW
	nSSVdWlQr7f1tFMq6/kSKYq4axEKdQpnJKjytp+iNkUskCB9A4WVMJeSzzOH8aFOzizydkwfFUk
	1AlVCTLs71OFcaZzEaT1f4I4R+aAYCOrpkEnqCKxOm4QEBenAJWm6mD3ALKsWhDc3awjQQ5Mm4O
	6uAzqmQblfr6aOafb1F6mdgLXGSZbXE4jlrFQCBzA8ZPog==
X-Received: by 2002:a17:90b:5868:b0:3ac:945c:7f69 with SMTP id 98e67ed59e1d1-3ae8980a25bmr2636860a91.66.1793381909231;
        Fri, 30 Oct 2026 10:38:29 -0700 (PDT)
Received: from [192.168.43.2] ([119.234.99.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84596e3bsm4964258a91.9.2026.10.30.10.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:38:28 -0700 (PDT)
From: Zhou Qiuyue <n0ps1edzz@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>, David S. Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Hangbin Liu <hangbin.liu@linux.dev>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject:
 Re: [PATCH net v2] ipv6: raw: fix use-after-free in rawv6_send_hdrinc()
Date: Sat, 31 Oct 2026 01:38:22 +0800
Message-ID: <179338190237.9376.13820542101227461550@gmail.com>
In-Reply-To: <20261030160532.4832d994@pumpkin>
References:
 <20261026044808.613-1-n0ps1edzz@gmail.com> <20261030160532.4832d994@pumpkin>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thanks, David.

Yes, in the redirect case it passes the old rt->dst.dev, while skb->dst
has already been replaced. That changes the NF_HOOK outdev, so it
probably belongs in a separate fix.

A bare rt6i_idev or dst.dev pointer looks unsafe, since dropping the old
route drops the refs they rely on. An explicit hold/put could replace the
RCU lock, but adds per-packet refs, and doesn't avoid the deferred route
free. As far as I can tell, that uses the embedded dst rcu_head; the
temporary rt6 in this path comes from the existing HDRINCL lookup, and v2
doesn't add a new alloc/free there.

I'll test moving the RCU read lock before l3mdev_ip6_out().
