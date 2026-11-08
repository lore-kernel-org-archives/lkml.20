Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794138461;
	b=HF5QIlAEaVGd3EoElkGoV591JuL7lD4DfZvbJh4Cz7TPbnYXaWeOb4GiT2u0eSRaaj+n
	 droXW88Qod7IKzO5J7R94wcEGwYZdvxKIzrNZJRhGSwfOjVoQZG/Z0q8/UCz5QafFCeEp
	 nMPh1uhJlK27Br6iNvICClCA0wScVaukBMxR+zIk353HcWWve6n91RVVLWsPyPa3yacLb
	 8/goRqRei2fZXhk9+I+T+yFPDnAjsRX9ZqqZPQ8uNSMyUiRXVEIlEdhkQbvBhaP2TxlV+
	 OhzU3cDXcw4fT7bA0S9t1IRoqNXbA1qLpbl5heHtXaYndkuVGsZAayu/ckRWGiEJwwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N8zDFvi1hwLlYUjQ4trPMNS9MFLc9+fuiBPttzeF26M=;
	b=K0aIK26Xa7krPZ9bY90zMJkr39Q8n97G0vA4k/6VyypGC/LoGHTRX13MrXahS6K+330n
	 L3T3xVg30rEFID3uoYfTZNRjed1K6l3TasIAgyfmsMqLP/CvgvHS3xtHnWyL2HObU+6Q5
	 XF6+yRrjyUDKjhji3uIXffaj9beP8g3R/2TUft3fnJ7j20FNpoEXa71910FO0ifphtRSS
	 JarCnCPKNO2j/k1cfZc0KQQu+Uq5xuRU+LwZO62mEWXMCev8YiyvX9qac41gS5QYhQLb1
	 CdidDjcCghU0GLU3Yu2RsluRABvIXU3o/J9ruVjKFcVB2tbMgNv+bhkiBwxWchxP3Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=kYDIvc8H;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398C7606A339
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 11:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 398C7606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=kYDIvc8H
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso7933366b.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 03:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794138460; x=1794743260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8zDFvi1hwLlYUjQ4trPMNS9MFLc9+fuiBPttzeF26M=;
        b=kYDIvc8HNmoGxfswBqPc/bn3mblGxFo6X+NJ3L6oqsxEZkkr+m4t0mn2WCfFkisaZO
         +KFV1GKZrUODGH1jwVzp2dNnj5AQFg8tobqawkkepyMCV76jlsH26F4xcbj5rx8O3AwI
         9y9XDB7H4Mj24QgP7ASo8k+gnbTy8bB844IB0ftN+jI98Z6wP7IalktLXytAnly4TLSb
         tnegld6MS9agPwfzU16YT5rqdpiykyv6RmW0AXz+25fiT4fvHfhrKl7YCilvolQ7pby7
         KCM2rNosTVSg6+YYd+rjunPAhjVoIVGBUQnx6yoLGsIubCuL3LXN2LPTQd2tbfdK180W
         7Oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794138460; x=1794743260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N8zDFvi1hwLlYUjQ4trPMNS9MFLc9+fuiBPttzeF26M=;
        b=ztl2gU1YUNLP5liOjVOrjlehEIu19QBrTvGKyEULzUM6KbvEpTgFg4tSkOnA4TLkPM
         ZgDdLCygrBUfLZdclh0vI+Qxua/Iegn1O4+H6H60bezv7r9x/j3p+nDFxULpVtL4IqKj
         rQcUb5Fup7rjPAh8t/xWBFMmlX9cOGuR5vwHoWdHPZDyZRnXgJgrhQDy2NsehLUZpoW1
         MJSpLKRcuAHIv75KrHj0ZbL3lDhoG7C0TteyAoep7mL7onQ0VFGQxr6kC0dManyyP1/2
         VRn2x7Uml9UsFlkCEt3GfEz4RTriKyOPc9Z5xCZlqqrPyqcm3s2T+9wfqeo34TZo4XUE
         uvbg==
X-Forwarded-Encrypted: i=1; AL+hErH3f118ndzvkxLwNsbkEF00gjdvJUD6ElWjBMqaAzWgf+a7BPPb1GMC3cEVTFzbKAetGeszQAoTj0EM5B4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UuQkp37BY+7HQr1/luBTg2gOhIG/uljJpO7hwt4ROgWtDNxkS
	5WGhIksGBi10b9cVgUDaGX+IGy+GVFIgWWFFWFp6IuvaKMfZiL2bxAja/inscbzB5Q==
X-Gm-Gg: AYBFou2GnHuZVqHr7qrRKYnCZmuvi6LNXidvIL7ySdupQiRAoBmFbcXOUT2lUkdoKJm
	OC5OTR62jP/e4Hj/UoXQD31t7IDwgQimdNsdQopO+d9yjR3SHoVw4TNuSUw0wfajpx998Eg1z+T
	gS0pL3NKGCTeMsTLYJNiV8ntgt5JSbTt792VpbjM3ZvI49I5IiaMLQKA7GxdD6w9N2I+oWshLJO
	nkC10xb42RT09Zlrw51kZJYl/f4HKWDyYBjTVPomHG2R4ZD0IZWB47pTuckxR3+ncfDgHgAClxp
	OXXuVfxI0fssjnELjNP6n4cV1DII7149HQ/q1f1Z/w/MdyXBBGm3cPlzpj2C891J5gPX0d55tJH
	ZPu8SNsDLVXn3RdPSpkVDdJucjaoL3tGye0bOlpStUN1kQ+YvqGCKkTF7nvAqi3yI31598l/NQO
	Q/FBbKuYX13UfJnSyk15uScx42KfHjKlf+qQzUWJDHYrgKWd5CAZdWDDByjgITU63Hf0CgEszmw
	YX/DFp2xdqIyXgeELf761elJsPyVLJaTIbI9AzhT9p5gSb58PYJ3GRKQKLj7uJM+8WoxG9xO2Ni
	g2JoGKfw81Fo3MsdUSVCXZzW5PLSXo6dn57b5Kru8ll8A+vXXbuVEL6IzDFj75iJhEnyuJhAV2c
	Df8Sqh2OL6N8kE/FXxpdJ9PGKXOlQkGg5Ph0gcdvZekq4z2ohDZAPbQdTGIepuM3k5rSwhZ1rIT
	3x7F4lw43mNyqjTpHsIo851Fl4pDpTv3q7v5pWvkAn5UnhdIRhhiAclWLioMSbqYeihHIWv5nq0
	FTMINAtqXkQDncedS3/xTpx2dpz50+unoF4osSuktavjNUa3jLKfv07/NkLrZD3UTcc4lQ537n/
	dbpS1F3/ynv5k/s+wkyffYtc3GMCVSnt1PJbs3I=
X-Received: by 2002:a17:906:c104:b0:c4d:28c7:eb21 with SMTP id a640c23a62f3a-c4d6d4f9deemr95174066b.29.1794138459778;
        Sun, 08 Nov 2026 03:47:39 -0800 (PST)
Received: from Desktop (p54afff19.dip0.t-ipconnect.de. [84.175.255.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d69f948c8sm56005766b.17.2026.11.08.03.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:47:39 -0800 (PST)
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
Subject: Re: [PATCH v2 1/4] clk: qcom: ipq-cmn-pll: Correct IPQ8074 NSS NoC rate
Date: Sun,  8 Nov 2026 12:47:39 +0100
Message-ID: <20261108114739.124995-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026120920.1667982-1-robimarko@gmail.com>
References: <20261026120920.1667982-1-robimarko@gmail.com>
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

On Mon, Oct 26, 2026 at 13:08:12 +0100, Robert Marko wrote:
> Report the 461.5 MHz output rate so consumers see the correct rate.
>
> Fixes: 4e36f8ab45c4 ("clk: qcom: ipq-cmn-pll: Add IPQ8074 SoC support")
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Tested-by: Julius Bairaktaris <julius@bairaktaris.de> # Xiaomi AX3600 (IPQ8074)

On OpenWrt with Linux 6.18: the NSS NoC clocks run at 461.5 MHz from
bias_pll_nss_noc_clk and the PPE and EDMA clocks at 300 MHz from
bias_pll_cc_clk, with no orphan clocks or probe deferrals, and the
EDMA has been forwarding WAN and LAN traffic for 20 hours.
