Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793717144;
	b=pxS8++J3bao6rf+q8+yIjlvBzSXaPl17WKwKihG+jMyGnIVw3gWKn7KjWKHYUDEvTsaM
	 +8sHCq+NfEEgAL0pedg/rbsyTOpC/SvSnyeYBz6GgESFlgulXegPe5ffY2Dvmo35TKM9Q
	 m1xXAiR+DO05iIaaIjH2jVwDXHgI6lLgD5YNSR/Znga0hnPimFgrqx2CjUA84T6Z4rJmr
	 VM3akl4ggFNA3AOjqoCdvZrJCz6b+TLa2qg0aQxqc4uLPevLSxLvorwTml9hjrSHnNzOH
	 pp39CT5aQaKP7f7WuENczIT6JMHHSk6jlAYCWwBvY7mvYePw6NnzSP+Sdwr7rUx4rSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=S4qcarRIzyPxsuQpd7GLOf5aNbdhnpO7LL1PTtmVaHY=;
	b=KYs0d0YlD6PbRSjGibMv0IQA15Ursnpve0lNBlw9k9vxxvmgzZHElvnJRNhWKrWDAQ8K
	 qFFVFFliSiBf9H1O4tctwFTIcFzVTRs0MFaenyV0ShqKcW14yqFKx3eNUZVH0SX7bjUXJ
	 3p7C/Po9KF8T5EvyslATpJoEPCPlnw/rzOc5ftptxYiyQZ1Dn8bilTvvxY5ceZnoV17hP
	 FVRSdB+L09sRri9o8GKHjw87LySGAqv5jgsJBOz4dc/xo7tIbkEh3GKS2fQ3Nv4R/adgN
	 fnqKv1mU93UrJsMyUDtDrbqcQwVEUR14ApXWOGgEEi+xoMO/UDTPY1venr93Yj551Rw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kizgfJ4A;
	arc=fail smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878E8606A33B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 878E8606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kizgfJ4A
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso35894387b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:45:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793717142; cv=none;
        d=google.com; s=arc-20260327;
        b=hpmr7ssYsWF4aWVaZu0GcXN+eInk12/QCcB45s6wy1BjT59N3MtIJEqSAJ6KaChGwO
         25qKv/lphFlOaVaPTT3sAKUk5mAkxEwm6qfowONAzpQ2DBDShaRCGUXgBF8QjhpXejm3
         coPT1BiBOHr8Es+kLWAFN6HoevZrEDJCVQ+ZAJbQGY4mNwOMrcQg8POonbS2cmV67fhi
         5oWFhL+UzCjLA1eFQKsHVD/evUIHTIjVkQQ4RVr8Gd31/Rs/zyTk0M0dTwyNqKEHZiv2
         GVLEHTnhs3BRWh/0SWZQnPvbqZRVjfAPQaCcckEhLqXK9IfFnYCoyDzX85IxcVz1/TVL
         1G7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S4qcarRIzyPxsuQpd7GLOf5aNbdhnpO7LL1PTtmVaHY=;
        fh=jyxoGz/fRUMdu30iCvHJA45h675khuP2kZgAFbDA3Us=;
        b=IpDaZobybrYYJKTg5crIvdGE1KvewFVQRByqshLFEANlMNrbTSq0oxQ8szaWp6ByNZ
         A0xnvS7ae9xVqcFE1chZDJen3pr4sJu+9kkzyg4PiopZpS8okqlYz9FOYUwYl5/+nbp0
         Od32eBuNimqTau3h093Ef4j5pXRJMacvZ2a97E288zKDg2aQd8kt+G4DcpDl1EJ4f50e
         bmAnFMz95VWlIuwYIt23jMXl17hb63rUzCH8esykjrjSE9kKALKUBp/H/MgirpbLd0/U
         FMZn2j3kadLCKYE/73ZogugowGowC7C5K3nkUj+JPZTp7HoEyxEljzu2sYmhnG4Jp5UT
         XiYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793717142; x=1794321942; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S4qcarRIzyPxsuQpd7GLOf5aNbdhnpO7LL1PTtmVaHY=;
        b=kizgfJ4Am7zPK5oTi1VjOREORBnLvfmMgkKMNVn5x7UU75Ox5QNhSkoxnWI1jtGpBQ
         0F/eshb2ZOoin6xvAfW25WS+8kDNNbcWNJI5P3lYSiq3b/9+U63w0Gd92LfCKl76afuG
         tJuSl7fGh0GzHU+PPvbzXEoPB5PyQfIAWCL1D0joNqPteZPb4w0frDM1jw2X8pF87iXv
         S75R7L0alOKvLZg3Shld63p46s52oektnO9r15+xj1iv/As4aj5Q+66IJwlMZvI1/L9S
         LvU1MgJW+QGUV1V5y8f+ecrthUI656REDGKCgsKY0EvwMjcJoVBpqb3zoBmBOK3Kv/2n
         Qm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717142; x=1794321942;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S4qcarRIzyPxsuQpd7GLOf5aNbdhnpO7LL1PTtmVaHY=;
        b=O8U6hRueui0zV8HyMHf7YVh/uBnkB5i67/wIw3/3RjNddaHcKj60d7z+n2OOk1PTgf
         yJWO82CpP1Zsq5MyES9jdBSpfdAJ4g8lGZq42FGO5f9Oj/FHbZHRMIHDWQRDmWtb3UhZ
         7OF2zWABtQXEsJjICMc8GVi53Gf1WwpBOX3hDt3m22OzZklYgAlwo4rmutci+bN/aH9a
         zQ63kCR4UBDME248N/xPtMJ7nDxlHOq3+cJxRYlHkBds7CaYpYUz2QECREdpfko4VVPl
         dWhfIOVNGttBewgkEVbrgS5+QY2j9FT6mwBMfxkUbSgiBa+gkGkZV+4BOVhlg0n2dJ/B
         raTQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5mip8qaFiT34DEiyoNrG2fMLmDK2FoTzye8gjwa2lHw/LbPKhBGljyNg92a979pxhSNCEJ7WvGGd6rFo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fy+mdVtqf71yyW28jOeJK+lGlvGLQFY4opunGjWUzHRXpPA8l
	gLi5mLrZq7TIJa6219eQpXeE1RAmnQltJ7iwyCmmej/gm6ZrYi/EQtzf3WHc90estPLuCLuZSVJ
	vHcrahX3QoSpoe7CmAk0tDiVC7MHD1w==
X-Gm-Gg: AYBFou1Vl80WlCm/fIbwEElCuAr4MKVnkRwtdbB02ENBq7vPejz5MCGlgIKRGcMvQb1
	eBLQjrC35WQNWVnoo4tcIXlbP2o1seiVu1HKc4AFtX6zm4HBfjMsswUj33Hw6+sg/n6b343VDlM
	TDRJGrKgoJNretghGKpmNgMomJjrVg9R76DNi9PCLBfUFOrBaAWxNGswdiYw4Ui0kAxVojGDF/I
	zzF8rlGFASD8O5u4cs/qOIlYQNRa3sx2bM7qmtx1+4iL+WiInHJ0ZmOletwh2ghfUa7lCjGoKpY
	X36imzRGgdqM0/TImLmOpwYGA+Bqo/K7zCEV3UvIEsll0NTvAAH5gus/GhRQ9pxM852Kg5/04CT
	lj/JC3s8+64LgmLAOJDgzFgEg+0ztfJdbZTrpQB1XPxEFyfZGmhXo8oUpszTER0qVAakyTsIDJ3
	38mPGWp4JXa0v7h2M=
X-Received: by 2002:a05:690e:1699:b0:67b:e91f:1eb4 with SMTP id
 956f58d0204a3-67be91f204dmr59967d50.105.1793717142405; Tue, 03 Nov 2026
 06:45:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com> <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com>
In-Reply-To: <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com>
From: Rajan Yadav <rajanyadav0307@gmail.com>
Date: Tue, 3 Nov 2026 08:45:31 -0600
X-Gm-Features: AclHuK8t5ej_tgD9GJGBIoXXh4hckeei19bttMW9q0EtGop8alsm0H9-n1doCqE
Message-ID: <CANxy8yTbu63ykQnqa_XA=HhV7JTDZd3ac2XWGzYNwuHBAd2DuQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
To: wens@kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 11/3/26 11:49, Andre Przywara wrote:
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks for the review, Andre.

> P.S. Since you have a device and have been looking at this: can you
> check the CPU speed bin selection? I think it's quite wrong for the
> A133.
[...]
> I would be grateful if you could dig into this and come up with OPP
> updates. Many thanks!

Yes, I will look into the speed bins and the A133 OPPs. I'll compare the
BSP's bin detection with what is in mainline, test on the K5C, and send
the result as a separate series.

Thanks,
Rajan
