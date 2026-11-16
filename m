Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794866906;
	b=tkapdbKLEAXT5/hh5omwpex7h4ZRa7WLoRzkjpFe0N6mpqpV6SUwG+roTCjihlEbYZCx
	 v0luBGOTjB8JPX1Vo6uX6VOUbMz6FjpRVF6tcGMWTWuTEusQtF0hKDRkDGMHySJJEaJvs
	 ITnJYGjSNzvbs412/azSTVlDi3nE/M6i12ewQYvFs4A+lAl+oaMvAQE0pZkcfd9xANc5f
	 7BYjiGm6RLh9Xsld1ojFOP38RuzBLLa5chb0namsdcY8WUSBiJmOalU3K2edJ1OeL55Tx
	 KDS0xbbGzgCpdRuYYQcHQCrXJQD0p+ImCUyRRGmo6pXd+oLT9nUjCrG0rGl2pAgAV/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=i+u549PmYZsY6qpU+DC+SKjR1dv37zUfAcYaMhaiLBo=;
	b=HPYOXAZQXizbW7nndv/6JXmX3q8f4+RohGpE+iYJT6NeU61/cGdd+ygxBL2Dvi5VFgj4
	 PdVDWdHHS/eRJ9xUQu5gR9rFhPwMeggXMByCQrBKKMUH8J5xqnQCh5GJms8HkWG0nWI8B
	 oVyMw1rSAOFulMrvCqZQ/8vyQoZZ7ppy3/zxxZVzwP8Ans1blRxXVkRD9oVoRhbu9HIR7
	 wJnDIDkyklTluIrOw6jCUcPNyX3iQYATq7du8JBz6G4W0stY8S2omQuur7RE10j/5gZNU
	 9tgjYzuPNl6YF4iK7MsgleyIoISzFzIfhTKgqKFxL6GbH6tvu/3OjExtsVNJ2Y6bYZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b7VDE0Lu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B2B606A8A8
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2B2B606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b7VDE0Lu
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50abd5b4fcso365524966b.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:08:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794866904; cv=none;
        d=google.com; s=arc-20260327;
        b=NW3gbmsxteBSd51dOzfo5MI7F+l00beumWdGGKq2b9H5n6JCOMPyaKRqh4kgpnqxrJ
         9HNdwZI2KCSP20Lp7C1Q4oSFKPTXlLsOS0LbJbehnXgvytSpBQev62IHZ457QRgQPZFM
         7K4LtJJ55F8MSpn/qe2HLGMWQqI6rMrJEf+RohmZgaPnKmsw3jPEaG//swv44BFX9LSH
         p4jSP+OnaRBUO95+9K4Fst2yYCQnd1J0ONI37qkCX/TP8fmu9BqulFYnz1+7RT0YHFmH
         TinnVE7V6puWX0t6i6nIJMXUcCb2x7ZS9u03eOLCIJ/lVITO521pdiA4ZNXffhthpk8K
         wqBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=i+u549PmYZsY6qpU+DC+SKjR1dv37zUfAcYaMhaiLBo=;
        fh=JkJKSUgyJijStQpASlrLdt01dqw3d3UsJpTPbmFwfOU=;
        b=Fbc4K9EqDpeOUcJ+amSRY5bBN88RHC+vTh3i5zm6nvJmpc5Dv9P3UDeMVN4pvIpx9J
         z8WjKP5M0Oie8ZUOYolO/lyQ7wO5hPX9K5LiR6vYPYs77IujWK5DjCI8p6U/25v6vSkq
         J2dBgbngKVjcUwXwcVj2y9NSGLvvg5gFdVtPyfqnfRshCnaUctz9GB3NjNQKpYhM3E5l
         aA6ih4mYOD62UUL1/3GSE88YXmd9Kl+2hXM2i0JB4n5hQx88xYW6nl7V/NqFHIM57vNa
         joXrUVL77YMKN01UokuAcxNaBkpqpwMBTnsodgSCcIPZ6AUfJFv0+iI+5uG2yYMzIXq+
         RKMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794866904; x=1795471704; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+u549PmYZsY6qpU+DC+SKjR1dv37zUfAcYaMhaiLBo=;
        b=b7VDE0LuEhaO1BSmQTnRF8IniMQqmqJdY8HFEwCfDiQxfFIGgWy/2IDS+iesB/nESm
         rZsekcxazK81N/3kmm02UV0+QQaJZj6bawX+4k6FVXdwh2+35D9hFnzquKg8S5a9CuRt
         qobKUGwfylVwL44ug9AXkc0uyn2Y6HnUnhrRGusraHL26SydKKc7BB3/uA7SPfVZ7z6d
         Ha0aMLXOIFHAkdpVusbBF1EZut80FQcg9lGyn99f4EUw/ZA//oyvDfPKYEmWtu0e4JG5
         JkV12luzSnwI98fyT2j2uWljepSknzdmblXPRwUUx7Qud/3kZv9cY7FIK2hbt5Qm8L3D
         Du2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866904; x=1795471704;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i+u549PmYZsY6qpU+DC+SKjR1dv37zUfAcYaMhaiLBo=;
        b=jBE4zHAcFEUKCPlDOrc69kTW2J7zP/xT+Ml/nz7U6Z5PFk6VSuf8bfIjqxh2nVOTaD
         MMu9LD2Y0iEATI/B0RhGwlfcoyIMP292IoYKB2CA9kc6LUSiIpR5RZGjdechsKNNu2nw
         dt7lvGOdCM28Zns2Tv9kGXk3uWVCDD9/5AUvze1Yq/s4wRfv2PCug+lGoCAhyx4k9cIK
         Gj88/sTOlEDmRA9uHP5Jbzjwn3h5DCdmCCWpkrPhz58Yr0Q3FXQhUIsNzGZBFvTvK50f
         aezgqXo83a3bqgKk1/Vg/XW2gte/btVdqfNQU9KbB88n644qG9FY03TaIAZCVVjESb1W
         O7Ow==
X-Forwarded-Encrypted: i=1; AL+hErEEN31ocwLdVwEhCsDlqkSvVcDw5Jfgz+btfCt08RaMzCLIDzVfwFWgCOlUZl5gp0dl07wplrdhmzRAq90=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QhzzQ5j4Zqg0UJSp1hv9x7KkbALQ/nviayXtbKAIiAqONgkn6
	xAej8HKdpYCsAljmjvplBfT3PtXUgGkH+uQU5/eZxQXlcun2UbE2UNstJUZYOlAwAdtU5NLeyxH
	3S0WsCTKoLPb0el+47c2zL967WvPhi6c=
X-Gm-Gg: AYBFou3gcJxa154CsC3/ywiWBMiqheSl2nXnipMKqDvqi7wtHV4A/jo26EplTQ2LXtN
	LCD1/bHxon4dm60BUgmyjvc1H9hB19qA7OWb6Re8jpxqFNsRLYNLIdmblcN7ZNH1mJJnuAGg0kA
	v6RTVbAGwiFO98gGCEqQBC7f5cuvQgdf7axRdukBJATThluZ6UeClUDMkl/BOXQ4SpcpPso67sD
	9UL1ONSMHvksyGUaHT7+iQpt/qjh/1W2mG2cX045auqwWwYnQYVFke4OHV7gAlXntMzwCpm3Zh3
	+BorSCD1kI8OMFVOwKTW6nerUD+A/I3SGPWd38Xk2jhzAoXZm90Nz91/JXqq726P+Ct71inXMLk
	8AurLVzBmIzMZF2YcJSy91FlU+aAJk0FAlkKn7vp51HC/xkXFbz47B2UnqX+9sPf8UnbCEVZynQ
	a9ViiT7gS8/fl8EQfMyL3ycFBTIpfXTq2VpiEbtuAoId0hte3usyceCFqRvGF9ysCT/hMhHgr0W
	zPTLu80rRrBSyC/
X-Received: by 2002:a17:907:d20:b0:c49:df95:fd0 with SMTP id
 a640c23a62f3a-c50963ffe1emr1036693366b.48.1794866904124; Mon, 16 Nov 2026
 14:08:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <9ed2d8fb-fad5-44b3-82a2-0021edb405f4@gmail.com> <avt-FbT69lemI4b0@wunner.de>
In-Reply-To: <avt-FbT69lemI4b0@wunner.de>
From: "Perlow, Jason" <jperlow@gmail.com>
Date: Mon, 16 Nov 2026 17:08:11 -0500
X-Gm-Features: AclHuK_ZNfer2RnVSrgjN_8SjUD6al7lDk9SqQU4Ps_4AtvEs8wiMTd_WnnN8Ls
Message-ID: <CABZrw2EEDCg3CG_uF40Cgdwabc-xQNHMHjh_KtqpAV2wrp5F3Q@mail.gmail.com>
Subject: Re: [PATCH] PCI/portdrv: Do not advertise DPC on ports without an AER capability
To: Lukas Wunner <lukas@wunner.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	Darshit Shah <darnshah@amazon.de>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
>
> DPC does not mandate AER support, so the condition in
> get_port_device_capability (which you're changing) is correct whereas
> the condition in dpc_probe() is wrong.  There's a patch pending which
> removes it:
>
> https://lore.kernel.org/r/2ce502e5caa57db01e0a7bbc781210b66b73bec8.1790531238.git.lukas@wunner.de/
>
> I'll respin the patch shortly.  The patch is tagged for stable.
> If you can't live with the error message until the patch gets
> picked up by the kernel version you're using, replace the
> -ENOTSUPP with -ENODEV to silence the error.
>
> Thanks,
>
> Lukas


Thanks!
