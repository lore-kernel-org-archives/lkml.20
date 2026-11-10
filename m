Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337090;
	b=hZu2GCZCwaETy/LhVEaxQXqGn5HoYpv5nS4le6s/RZ5Zb4A/9SghaRaiFs/OqlmOG31t
	 J028fkRDHcP7Si1KqZ6R3A319m1AzhKNjMxVZeqVzkr27b3hSsCRovOIUC9AsrrATi8O+
	 xIPAMmedDReEvchf5EDAHxXn1vgk8dkxX4gDne656Im+J4tcWm5UJseIJd+TSP5Jk/cZp
	 frieZWVjk2ii4y/RvpeGmT52xsfA/iO1v87GTOJ3o6f4p5ywxsfR+8kE/7uI4a5FwdvkI
	 cLm02gzW0wFoxc6gevwH+YG1RSh/XmZtHOuq0AHQ0iHZUOZACPnK4H3R6tmcIP8Ntww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uax/a+Cf5PnYF3LAag3fOWDgi1ERLoTCpA7WArwoVB4=;
	b=FjiM/VF4GpylKbcppA8+37lmJ14gODdb+/ZWEQzFwELA9JXRk8SfeAeexJS8lj0XT10k
	 ZbJocdDwmhB/FM/WuVBjPyGsYFw449G1E48IJrsfq9rHjAkQdTTsGQL17+nO3XmMJcB/N
	 h09/1NC7/oYY3+nSttmTTK9wN5ogU36t59BIHhWUCOQ9YSulXIHqlb2YdZ2FSEEoP2N/w
	 AOQBYFXSr1jqUgIulWmujlUls75qqSEf/xtpSAir54qdAmIbcTx9wDLWxRa4hAFuV6Xo0
	 s4LpyAFCalTP0wkm5aOjKUrLsjPwoH1DwlwfEI/t3kEjkotbUHxE66NypHkNLxrT2iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hC8j81W4;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3903060A2602
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3903060A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hC8j81W4
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93f22a8515eso192374685a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794337089; x=1794941889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uax/a+Cf5PnYF3LAag3fOWDgi1ERLoTCpA7WArwoVB4=;
        b=hC8j81W4XVy6GM6NSCd0k/bnKZL9dDfHbCnjIHZEMV4YCCxJo+rbG8Q2gJ1ziBpLGq
         b/WGl7uM+GbW0ScCbcGRV81gVeRTeNgz0MizF5kMHCM5ZPPdbitL1rbaLNattI6y9fcm
         0DpQSnY4WXKFOr6Wn7dT2dmcAELqKsJEKzR++vApSbK2g+bqtAQ3mQs5BCzW7QtRSntj
         GWWCQkNu74fERR+RfULkWg5huVt0eR7NbF0yCDO4S9QOY3TsdNE17R5IVmsDeMYlMoLP
         36wy31vJ31vDKQ9MKJyqWq+R6e/unEw5WoidBXKtWmZIODw2TxbkPGzvtWf17iNMm5uC
         b7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337089; x=1794941889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uax/a+Cf5PnYF3LAag3fOWDgi1ERLoTCpA7WArwoVB4=;
        b=VDEa9EE3hHfdHOjKpEZAboEhrgXCNPT9fzXmwmdbOKv8M3+eQ5B16BSTsuZFXx7RfQ
         w+XGUNpTNztv3GfPuS51bD4BGd7XLVU3wDhx/qHHz16V5Z8ro6Xwk8bh06W52Oel6cHL
         O/9dIKixMm5TlklyLgaBEe1/BD2/w+vCuEb6SzR0zEGdHLQY3Sc287pkBKyyUxfnv29Z
         a68EfAhl6ynZWWhMdayup/O+t3MQku49qMO5tg+2we7cOuXhyHZPxyh33u9tuSomuqph
         EOsbc7t2JOlIDYXdWnI+1Dj1jzS25ppDpYYYwmX8eSLZLnLLfxstnMCJ4dDZ68y6vUU9
         LgLQ==
X-Forwarded-Encrypted: i=1; AL+hErGtXJmU2eHGq/v8P3ZsvGO1hB03jtLhuF6SEVZRNjyh3ynWcPlv//05rfH3GInlshcTEo5iHRVCs7KNv/k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fILDssGGGfuf+UE7ZGiYK/ZDn3BH/8Kw/4lEe4Hy2aKKMYLaf
	FBK+Lkxjso95677qtVfF+KrwodkTSvCTSuEmM9ctAMQXn2DnGa8H99Cl
X-Gm-Gg: AYBFou0UzNwVPAJTSbPL9B1nAAR/Y8AzHZcXcWRlXZX7LDTat/csgSMWBZXi4TZ7H2f
	DY4lw4NlU1zdjCtDUjtSKvixEP4JjH6mzFM2tqZfjsU31J6uq0Jiz4mNOGawtoTwMLeS0aXiQ1E
	cAoeB+y5e7TMqa/HfE7sKWAZZwJMaNfJv9NpdxiWdyGlv0Wz8/JUKT28+Lko2Sz6N4YTQ240nQv
	3g8cViZMWXABVXyzyH/Kfz3Bp7xHSM1F/mhq1y2Rllxkx8C2izf9/IDWGBBIkwdOYOCDj4/zep2
	45iX2RV+c1Po5u4217FbejpIfCnr1cJRQVaFGENDSPJ1Do36D10QayVQbgIGnQ7zh3aRWjnfRzY
	iZNXL16btdjKwKeERF61CECiryQQvPh9is0jM9dpT7iWkOramhR5wEpwy1krqPzX/8p+NmJnle1
	acIf57adIAkaG/QNBaDXiQboZSeq/H2bgtwH7Xb5BHhG57nSR9S1eBhk57QneK4L4YU9+cvk+pA
	w4RH/P/l3nvQj2GwACvW1Ki7F9fl/MrATpbgRHKlIEBDsUIlIEZT5732zHWpTQYz9dxBeemRebo
	SSz+VG+cyfny/UoikaQYiEcY6V4EDsoMZYjXG2m/LWPyVIUJBxQXJVHDR+hq+9bx6NM3UKHyCXq
	5+YadLDB92mgBGNf209Q6t4ahILbstTzQkFBi4IWKgT3nRKBsE0IKkIjYuvsA5I9pb88JXEp65A
	0ouU0H8xV6tztb+LgFMZoZNhGH7N/fIuw9xA68kslHKyp2cRHjS7yR/3evsakIKKba5YSVKga8u
	kxxH9y0I/35WGB5qvbU0+CacOC8+AVxEE0gC8Khim+vmQ==
X-Received: by 2002:a05:620a:4041:b0:93e:c12c:f127 with SMTP id af79cd13be357-9479f38d707mr575616785a.83.1794337089011;
        Tue, 10 Nov 2026 10:58:09 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:940a:c6ea:f292:3644])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e619affsm290954085a.4.2026.11.10.10.58.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 10:58:08 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/8] Bluetooth: hci_qca: Add M.2 Bluetooth device support using pwrseq
Date: Tue, 10 Nov 2026 13:58:04 -0500
Message-ID: <20261110185804.56861-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261005-monza-wireless-v7-1-5a6de7662dcb@oss.qualcomm.com>
References: <20261005-monza-wireless-v7-1-5a6de7662dcb@oss.qualcomm.com>
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

Tested on an ASUS Zenbook A16 (UX3607OA, X2 Elite), whose mainline DT
connects Bluetooth through the M.2 E connector (W_DISABLE2# on GPIO
116), with the QCC2072 support from [1] on top. Without this patch
hci_qca asks for a "bluetooth" pwrseq target the connector doesn't
provide, W_DISABLE2# stays asserted and reading the version times out
(-110). With it, W_DISABLE2# is released, setup completes and a phone
connects.

[1] https://lore.kernel.org/r/20260727-rb3-industrial-bt-uart-v2-0-2d100f30e202@oss.qualcomm.com

Tested-by: Jesse Casco <jesse.casco@gmail.com> # ASUS Zenbook A16 (UX3607OA)
