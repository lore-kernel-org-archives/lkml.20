Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7887C43E486
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789627404; cv=pass; b=YjIxMCFkJnwh+5Kr42vJuAl2RPla6HrOhUTCkBPxmAKAts2RQPQ31EhSbhzBtvXaSbLzvMwuljK5idRyikxxuNbGf38gu/FdDjQJB6yGPWMsi/hob7/vmo61v49FqS9eQbxDKy6MHbimHqrp75S12e5lEIAi2HXgof7DSIVKexI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789627404; c=relaxed/simple;
	bh=iF9IC0Ww9P1PQeAOVHIvIeKZQhHeM7arIW5mQv7Oi6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QYimxxWg1u3lIjI9LinwG5cRd9KdFkE8ruCTWConf0BcfXyC/0X+xQL+JDDDlfH3TXKiCv080LUYFswYF7dQujPiYgP+hq01VXk7dLB/Petiu7m1iOJvewoLTPN72XQG+ZPNR8ROWgEZuKUZYQ16uwAtoahMwWBUFu1m8rXCYgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCrgmO7O; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCrgmO7O"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb767cc71so3815781cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:43:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789627398; cv=none;
        d=google.com; s=arc-20260327;
        b=mY0TsSGvnmwfTPaeiGFQcrg5HEHNuovV7vyRklhLRj01gTQfoPv9dFdOuoVzwo+A78
         GT3Bs/I8fRYQm/Kk4qyb8JK83eYXGe+Lfo9pBa1sdTlrYRBoREmysv4YhvaDzNbCBbq/
         9AVGdlnWD3mfQfDPL+baVdrrhSMNYu6y9y4x/oHxk0s1KTjFWQKVeB5Pq2puZyjVJFjH
         XWmct6vz9hsXOxbjRch4hOgtPp59RH8+sDICqc38BU8Pruoe/xlvM8QlGdNbfIvSMI6Y
         Re5i9xx4Z9HlRE+PRoD4x52NNNZfsID7KAMiQNRYNDF0VNuVmqZGT9cp8ew79BDL6tBW
         BYrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iF9IC0Ww9P1PQeAOVHIvIeKZQhHeM7arIW5mQv7Oi6E=;
        fh=YxmMITHj8Zj6HfsJXXdHivtMurPGdEV1d6Q3u1JDsrQ=;
        b=UumQsROiQy3nielF4sTH79TcL1YYBPrj0baKpIpagTjjfXoCLM9jZrZcmpAdNDGPNJ
         GWO/JK7M4lGUD2ZHOPUxnhcLFV1UProPi95n6U8CRGVFTxP/QkKSWixp8WDIICVTNhY+
         Ww1hR57TFTYqToIy5veeLp++VRevKwVp0p29Km4oYem/37oHCvFWwGWYivSIwSDTHNjg
         NhhgDD39NMlzP9grPzEOEIju5+5dROWvdcr7yR2v2c+aK+DN2TtrG7zoO6zyR9d08JAP
         9UTEC/VRuePL9WnAQ6M9fRwpt5IbIpNqcYB19D67TFAT2KrCwxivzGsxNYL8MsKHfJVI
         fDlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789627398; x=1790232198; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iF9IC0Ww9P1PQeAOVHIvIeKZQhHeM7arIW5mQv7Oi6E=;
        b=iCrgmO7OPliEQzqBbml3sQiFH/C+xCYALws4iKaOXNhOtOr/zh3gi0W1CO4QxiANez
         D3wO3I8MigUbUwtp7E9unoRqQbF/9k6bmm0g2hNfwma1ZvLF6tvrqgX7fbbqDnaAVOMl
         x9EOnUTH/xmnfzTD4TOhQHVBtBSRgDCNwC1tNMRbe0dGe6SvBRujz3m98w9EKvlvvTMl
         b5yjOuaEF/Hkc1JCrUXfpucbppO/KXqnme2jSBORk4kNnrLc3icdpdo2p99w5OVwXkSN
         KdKdeC9UZn9o6zi52ADGdw6XaalLYRuYYEkGjrub8GZkYOJpXsdRAbQX2iCWqk35Xlwy
         s1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789627398; x=1790232198;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iF9IC0Ww9P1PQeAOVHIvIeKZQhHeM7arIW5mQv7Oi6E=;
        b=2y8NFbasg8iI0jj6X6nyIrkR4MG+x9O9b/enWjmv+3IWu/d0EQRRzwb9XFtewakfSc
         01Kvn4/2BEk7VTJVRLL+bm0eIcXNhh1gVsgpCmPVmzJY/2BT9Cq6L32gMV9MNW6K7AjT
         lnY8oDWf0fsehopsl+Iu92ljMa5zwYotZNqjd9G8eso3gM5fQBp7Prv2u/eRXTiTZqHJ
         Lj0hG1G6LtGtvzNaVqTzBJmAxbvX0yWZ9K8T8y/SsdUM8kxclfZukKUegRPQJmY87jD7
         cUooFXy1ugpUVQMPIWkI9cghWWoNNV+TQ7vWkEJBp0a7UJRRC7kmnVTegCmarSEQGmqB
         C8aA==
X-Forwarded-Encrypted: i=1; AKwUvByWbVPT+sMVnBeS3dldlxmTif5yggdx2Yvb0x2qq7dtV1hKTwTLt7drZzEwwtmqG8zwTQjgH2EyI/XYvD0=@vger.kernel.org
X-Gm-Message-State: AFuF++lpb3s/vIZ+dlxpBgChpTvHxRCNztySJ46C7GcYBrcC249bYvQ3
	qkSY5sbS/kghHkrfwiQNtp0MSVoL/Q4v0qs2M6qcl4Eq8Ep2EkUmgNjOOQvJo8avChr5abeiJJX
	aP83auCpalxa76KE+Tpz2zXD9DJlYTZGwnIyCl1Q=
X-Gm-Gg: AYBFou1z4b7NsmEUujUNfANbkEPfEzz+RtHthF1IKDcJjZLyOyYhx0/6dQzkvAhUxU+
	FkmbsRImi/C+LTO5YuGEQPOOfvKwARgmekGvazGFchN0VG2bUkgUKlhfSx71vozGNlClzxTKye/
	gq7FHovysOVlCFYRu4u+U1syEQzHCnyX42fy7yaJ9zEuy6EjXrK16MbqW/douOBnAkD/59IGiq+
	uSnthsuzniZ9KwPEg8/PLYhVKxnTA+6oqGoLtz5+WqDffqgClAEqrPZYn21dYiNcvS61dOCBa96
	n75Lz2pPGNJCE65RCbYy9oXFrfrC2xnP4U6BeMCkNxvJnbg8SQLmoejY
X-Received: by 2002:a05:622a:58cc:b0:530:feae:130a with SMTP id
 d75a77b69052e-5327ed75c74mr102732471cf.11.1789627398229; Wed, 16 Sep 2026
 23:43:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917060948.14700-1-palaomer100@gmail.com> <d0ba41a2-6d4b-4bba-b147-d287bcd9b179@kernel.org>
In-Reply-To: <d0ba41a2-6d4b-4bba-b147-d287bcd9b179@kernel.org>
From: =?UTF-8?Q?=C3=96mer_PALA?= <palaomer100@gmail.com>
Date: Thu, 17 Sep 2026 09:42:56 +0300
X-Gm-Features: AcwNN1W5u0fdpGa4ENT0dZ7irXfB5ehQ6MdwksADrwwfNdm6bS_Me35uFnyAKQw
Message-ID: <CAKhZXnp_oYvhmcjv0piYC5MpmH2Lqsy_Z3-ofzKPX_iRxnP3EA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: misc: add xlnx,axi-fifo-mm-s
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Same day? Are you coordinating this anyhow?
> https://lore.kernel.org/all/20260916201253.483877-1-matyasdaniel005@gmail.com/
>
> Anyway, same answer.
>
> Best regards,
> Krzysztof

Oh, i didn't look up archives.

Sorry for wasting your time.

You can drop my patch.

Best Regards
Omer PALA
