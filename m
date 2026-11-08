Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794138468;
	b=zPrNwKffEWqa03dwvr9mDPd8HYLx5F8NZINWS/C3Fg5BRqt+sr4c78vO7LYsLLlnC4n4
	 DZdb73eQQsUE661PnEtcRLOd5FtXlLIYsz/GxiQbCyyZiqXqqRpypfYWfZKTF1Nz1DBYG
	 tR4EW6eAWbfrxVh9GusZLHKjRqtj8GKwdjCEEYM6Yfeg1YaF7fEXpTxfa7AMoaD6xGIzE
	 KfGJBZT7/h1aS0ZpvqsF7kSlXa8hLW7GUOal1FhKxphkTHMHgNsIsAkqfqTdDEWgJyXRx
	 UwDAv5oxd4YRlQ2+Z9wT/nmIKpSRMsL3uxjrKUm/+IpQ9oxGf3cjJXpxKT6FCuykvmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dH6h1kBUvb/ripshwEjaT3O4DrKwOfPQAnnj8h0Dg4w=;
	b=zjNlOGNJKNrIc47kFRFyGIDOuyn+WLgqK3K0FmrvTZObuhwWyYJX7yiMgIANUJfiE13j
	 EcdWG2y2i9YJV2xc0bY1y3cxRtN4Tcp/n81l4KP8PETdHdXW4shgB3bSxgbW//mVdOqVL
	 nb+kigT3qB/KWD0IixlMSYvEVZQ2L6/AfLCDeuY3pPzoSezvfSDSiBO8DTYzakK7OLaCs
	 8oYHd8NUIIhY7MX1uf93wdhU99ToB9e2Ep7CLSgDgW3NA5AeY+FttnLQmJIb2s45dMqQE
	 aiOhkH3XOHyc0UZiRNwHz+MhWBcWbsvysGekXLZ8Gh8UFFuYFzeWS4Vzrczq2Okxknw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=TNZIiP2m;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8CC606D803
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 11:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB8CC606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=TNZIiP2m
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c434376dbebso1817666b.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 03:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794138462; x=1794743262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dH6h1kBUvb/ripshwEjaT3O4DrKwOfPQAnnj8h0Dg4w=;
        b=TNZIiP2mx/Dm+kFpt/r1t/gzDe0z+B+AK7jZUUJVHZpQaqckKljPzg+WE/0kBtU+LU
         odAmcgVPrwsYZ1LD074BZUd5uktTD309486lqhSxLZDOwmdkAVejFdzQQvmgxxr8rsIy
         S4zkq41lg4u/Gr9jLBMqaDftfK8631vgHka5rqjiQDQNZjkgJEX748C4OTUa3OkFTMXt
         lF12ALvJkxrWLdyNixF73d8KRL7gYbfOL6cl3/b1b3acDicR5gsAyDE6R1vm/aTx8KVs
         rysc7GMPhbWTd+ihXr7DxMSjDjYPD0U+MwEqdrq1OlvCwWFHqceYaKulD93/xsJNMEOx
         Fs2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794138462; x=1794743262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dH6h1kBUvb/ripshwEjaT3O4DrKwOfPQAnnj8h0Dg4w=;
        b=DefEQpOPiZq0TKimwIN6bxgBAfOzPAEnhce02N/8hYFNmZz1spUv2EIV8ALw5DEoTy
         SifCrhlgc1EnKu5qV3tO8bXV+X+gv5km9eWdaxeCyP5Uraix6cBcVpYujtU/6VoXUHJR
         m1IhBlnqZ5H4o9KLvUNPzd3YS57YcUNBgv4I6nvRlPeU4Z8grUvMqlzR2BDutJAJDOhm
         W0IR6hTGMvg9P3DKBh6rq9/hznnMAYlmLOAB5JHWvX0oOhQa6vvNz+4lucADHt3NpRjq
         Zg3/WVv9HPUgfj0g+hGkqZ5RVdGNZTmPnzTTIXHgiV6F/R0tp2iH0CR8u8Q8SBYszK2D
         c2WA==
X-Forwarded-Encrypted: i=1; AL+hErGiNhxDVbqZivWK4WD5xBO/TgoXnVamF0pJlcJ/zxAloqeSPHPIylGtZkmBWdWQRUYzbikyktV3K8d9z2o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8j/Y43ZR5IoCu1MJJk3pPfSoHnbd0bZhJVOA6+Q3L6ffPPrg/F
	kjgCUHcn3RAUU/XbxRBNBIiRyMryEDVNTPfjBR/75uK9qMyHIaoWLZ9PptdcMgEpjg==
X-Gm-Gg: AYBFou1y5EEc9qrXL8XCx8CXKGx3lUvgWpuSuwfKLMiwwJON/O/F4eSy5v69epkrlFB
	S1uLRXu5elEv7SP57lBLYqmnCXCUsANLJ99GTX7m5V949J8xqI8f/99jmYfSbTNoA1GZ4co/dMy
	XR1J0qmUBf9AmkMdNTtBzvYGciqbrzyDO0F0n8z80PLjkflejkDjp8BHrEqJ3iFk5VzqsD10FZR
	3ffC8vurSZ6aCOD716HG41mBsaVTeRe8qKgkYAyR8JZqcHD9EjgXv9tqLc2Z2ElAcSukgsUfviv
	m5ODrWfdRDZy7qYXEDgy+FhOY0fwYRkFb+5LaefJp5aUkTH+Bbv6wekP85qA/jSv8FXZ/boNKsN
	KC7YZ6y4XW1DremcGEe8hu+yfi3TZof2XoGM0sH0z042Y4qn+EY5PJm0Y/xl++AnXWt+8eHUJnH
	AZp5Ewp2vGBxspGYCc5MOCPrdOMjpiACC1aSzC2t3e7gtSeUmDTctbhxpGhrtqFFOOKcvT/UcCg
	fbeRVMUKqvSBUeRZBKFtEEdm3GI2dkT3x2WGYLb/in0im8HV3qLnCorLSO1eMN3ATgGBUmt8X77
	nkX76DafeRcFMYHr6FO4XHSBzzvTcQoHschC3nKt4wVcCy7gX7JdGt13Cft8swF6iq4CAmo8/1P
	FHb+MqGmY+hE5rFjiP6t2iUnYbgSSxxaMzjcWGH1VE4rpDB56LKP+L6QIeJ5fKqYShhS7VCF52/
	a92zlpQdyoKg8Rf7VmLkIMMHA8ZFOf0cNlpzliqs3Ito2cmuq0hkXUxAIMazhk4+Vt56sbtMLSh
	5gWE1OtRnyPnRVP/vNy5FHVUUJ+Jrmgy2My99SWnkCPkeKKVHWQhgvydlug1Eae2JdbGOCq/Nbb
	aM9AEP0hl/dFrc4sAIo=
X-Received: by 2002:a17:907:6ea4:b0:c46:8b87:c212 with SMTP id a640c23a62f3a-c4d6db7c9b2mr101123266b.20.1794138462143;
        Sun, 08 Nov 2026 03:47:42 -0800 (PST)
Received: from Desktop (p54afff19.dip0.t-ipconnect.de. [84.175.255.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a999b01sm56346666b.77.2026.11.08.03.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:47:41 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: robimarko@gmail.com
Cc: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	ansuelsmth@gmail.com,
	john@phrozen.org,
	konrad.dybcio@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com,
	krzk@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: qcom: gcc-ipq8074: Align CMN PLL inputs with binding
Date: Sun,  8 Nov 2026 12:47:41 +0100
Message-ID: <20261108114741.125238-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026120920.1667982-3-robimarko@gmail.com>
References: <20261026120920.1667982-1-robimarko@gmail.com> <20261026120920.1667982-3-robimarko@gmail.com>
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

(Resent with the lists on Cc; the first copy went to the To:
address only.)

On Mon, Oct 26, 2026 at 13:08:14 +0100, Robert Marko wrote:
> Keep the existing .name values as fallbacks for older device trees
> without these optional inputs.
>
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Tested-by: Julius Bairaktaris <julius@bairaktaris.de> # Xiaomi AX3600 (IPQ8074)

On OpenWrt with Linux 6.18: the NSS NoC clocks run at 461.5 MHz from
bias_pll_nss_noc_clk and the PPE and EDMA clocks at 300 MHz from
bias_pll_cc_clk, with no orphan clocks or probe deferrals, and the
EDMA has been forwarding WAN and LAN traffic for 20 hours.
