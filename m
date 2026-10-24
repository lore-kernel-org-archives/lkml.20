Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792802141;
	b=p+7tPJ1rALu1CBFvqry/Z/xlGVosNkQh2yQ89UWPXDF4eeHKCL3ztNjSCNeYZoNkI9E8
	 QB2ZT+1IzxK016UAOh5Q01tldzfWuPvIYCmULNDYNPI0mYgPxnyRZCcmWqxpjkxfpQMbN
	 AhdkY062r92pPhyIxqhmfx4p6TMdUEkat0OjLKN+nbVF4RoszNY2J+yGfKME14qE6vaOU
	 5xq2seYnbebdJB7zbrvUpt5oVc81ztfUQK7BGXgjhNqwCFanV5hGyb2J/Sph/9QQoPP8I
	 RcbfBNQ7+1bcuAxRqcAU0zStoXi95+KMBLeV5i3X2e6xuCC3/QIRLCDY2jNKu1S6kNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792802141;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DUaa2wlIXAwdRHkconzS2itK3kWYEvU9w8eNOhhQ0hM=;
	b=yzlkgQt29diAhPny86U+0r8WlhDJ+pv8MNKvGKEQfmHxuChCckaDh24xxHRfLVFEHdHx
	 cqODhKrmYPnM7ILPbuogDqjs4tB0Z82LbGPmvSMXB7MVYy02bVlrMsv3l6Zm1zoY3zgC7
	 HKRYkzInWbMRmnNilBZc7TeQDdxmjdQdmUPT8JioZU7Qq0xX1sN0I9aak2nJXU7tDTtvu
	 1vD4X8pPGYGBUgrMtu7cbWU/tyKLrYC3j9t3qP2scOA0zH2xZ9tc8VXk4G7EK+Xpk7eyZ
	 UxaDgn4tV6aNI3fCsd1TmGO6x4W3CdOVYHMcQukBDAUtgNxLVROWOUqggCbRhBf9SMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jV1X7e8Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hWa11EDt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BF1606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90BF1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jV1X7e8Y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hWa11EDt
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLv7RL3683559
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DUaa2wlIXAwdRHkconzS2i
	tK3kWYEvU9w8eNOhhQ0hM=; b=jV1X7e8YMqZw6ch/Q7ap8u9m0+lOjPsQuFvRm1
	A1S1qywx16QPYKZYOc+af1H9QxeS77iCr96cez5DeJ7fyL/04GeZCeaC0szSaT46
	ogdg81DsnOCiOTpVf3bvMG1g6G4JIQ3ee8uMBoAK2bLSO020pfWIYdeQ0CR30yBT
	cA92iaa4Cu0Uc3pTOl83edB6PCHlg3u4feE9yRxi6Wd8Q1Iu/6IXE6bi7YOEn6Jr
	BTdaLtAsEb4Tk5fNd222U4dLBfrSVOxQirYso6VQeoYqmbliK4+JaJ0XXcIlK7nG
	OdphzIBBWzo00DN8t2Cf+GJ3ZBwCi/aD40bIFNhA6WDKOzmg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas6sg4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:35:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1e62510cso364897785a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802139; x=1793406939; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DUaa2wlIXAwdRHkconzS2itK3kWYEvU9w8eNOhhQ0hM=;
        b=hWa11EDtP1yO2f0u8m0PelpD4m0GiCtq2NnME6qQd+VfNA2pwXpP6W+RzhldQ0m0hf
         G8o9Y5mR5Tk9vCGV92Kk9qoDQiD0xeNveQAGgIG/6UrIhIP0vPhoWKRAi5xdyFCRKL5K
         kP85hPx/LEB2kfltoWwIsqxdGRQQ23tZnD7yW4HpsiJ60qRZFITmnOUK6UyX6vLO02UG
         TLqRRhZ5W3zKEWUvqazcp2Zno11UkIsICvVlVqnjBDvTHQL9qFDZwY6bo3B/tdDTTkno
         J5RkcT9GNYj2LLeqgkjNy1B9FrQHN3Z0AfIPh24N7rdPXMZfNnjStSDVaALZTkqGp77i
         CysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802139; x=1793406939;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DUaa2wlIXAwdRHkconzS2itK3kWYEvU9w8eNOhhQ0hM=;
        b=NMElfBwgf6aai4J8RgoXpZyVHGOA5i6oC3kHb9BA1TKgZK3Cc0s1EtbSsxs9CUf8rZ
         RRIutnH97B5cp6oFLCRw2VOvbJ/CN38642IpWhAcEEOTRse/JJjh5GitDbfpZFMOngR4
         BI4DmgVJY5Cs+alu5FW66AjZPeHG7oW0LYFWLfl6BiyaIEnvQUn9qlcxvJcNcObHSGea
         P8z9NuZxfkEe/AOa0r804H8zR0CKEbf0JYyOsyOCCmM/bBvI8lpCnB2sZpoNjda38Y1W
         LQpo/uaxFp7KT+Xci9ePImnd7CZbx76rQI+vfXA+9/c8fOGmNEHXcGWRkh1Idl73XSwX
         U5Eg==
X-Forwarded-Encrypted: i=1; AKwUvBw7gs4gj1834ADJHLCRUg94cn9b2VNsBP99XyCSDwNBc6E6iCzncsfk7o4G/DYhzUIkRZ8mTx4j7/KAIik=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2ag8ZcKvZ5S3HnNfCUMBPYeDKZKXpNAMAy9li4CYrqlPbG7Pg
	ZV4VuEOlVveLo3YPejDDKs1OCTk+YtzGPYjbBaQAkrGctUS0HmkTavWr5ORDC5xC19b6gZyjRWk
	ZLiEF2pM0dcyo/n6IPsaYxGYv5ld4b0F8CGgHP+kO9slQ5NAdod2grEOqnGsCk6AzKLs=
X-Gm-Gg: AYBFou29e5IVF3HfOa4zgY3LuNIXMmcWrAUcIYD7qjeP3fQ/BUwJaFEA48ZvGrDHjy0
	ji/tSFkZaoeoQ9sKudtE2RAjjVBX+1m/uAUGD/Me/ys+mesNUmvvvMyVRA0T/q1aYJNIp2k0LiF
	+cx2KVnnPCCAbuq/0A+aqBPD32tsAzZYWRGsALWg6dzEJglnv9E9d9jG3DUG32tjdblcoSzITIo
	KuChHA+HMpR/ukKq8Qsrqdj7W1GOUG29yIjkIPvLX8UxIF9BPhwbEeJNR9aJT0m+ELsXEH6B7qz
	/3A5TXm5vXcpnfh6MlhNrSM/R9roF69xkVN299g0kgLp0YyyCIcNOtIGuNemBiizq0belNrpXml
	dWLP2lU3OhqOqXdh6sUURM/tUmWxE/+RAu9hLwsXsSWAyIbr7UZEzPFG6WeNyGoD3o4LkqWp6qC
	+grR/lAtGkmwOJ
X-Received: by 2002:a05:620a:8390:b0:93b:be6d:4f3e with SMTP id af79cd13be357-940ef913ca6mr127359485a.25.1792802138474;
        Fri, 23 Oct 2026 17:35:38 -0700 (PDT)
X-Received: by 2002:a05:620a:8390:b0:93b:be6d:4f3e with SMTP id af79cd13be357-940ef913ca6mr127356585a.25.1792802137971;
        Fri, 23 Oct 2026 17:35:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:35:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v8 0/9] drm: handle IRQ_HPD events correctly
Date: Sat, 24 Oct 2026 03:35:16 +0300
Message-Id: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAET922oC/3XPTW7DIBAF4KtErEs0DBjirHqPqgt+hoaqsRPjW
 K2i3L2Qqk1UxxukJw3fvDmzTEOizLarMxtoSjn1XQmbpxXzO9u9EU+hZIaAGpRQfHcIPA1HThN
 1Y+Zk0Hkw2jZRsPLpMFBMn1fw5fUn55N7Jz9WpU7sUh774eu6cRJ17hfX//FJcODCOhGFjw4dP
 vc5r48n++H7/X5dHlZ3THinIMwULIoCjJHQUEvtgiLvFTFTZFVUQBcVhOiXuqibomEzU1RRJDi
 NTspGbcyC0tyU9sFFTVFiFIEAWvBmqYv+UwQgzhRdu0hDVoZgrV5SzL0iZ4opSmOstMWJ0NID5
 XK5fAP2By6daQIAAA==
X-Change-ID: 20260414-hpd-irq-events-e72bc076a5f1
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6437;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tc/V3kY1g/aFDuKXC2Rr02qE2Mq3jARnBUYzK+yIUBM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1HQty/fk/GhbBTh48kUr5wdSBht1C93PaEf
 7Jjh5065T2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9RwAKCRCLPIo+Aiko
 1WcFB/4yLkQEreXYZW3IpFJoRUXl9AKX9Bfugvanb0aEWQZqry3VNesZSHDkrzzQyLiL9h7fipD
 XhmBiAwfdiPRHrBIMZLAbL1lRIAJrMnG258DCXsYvgRJo4Jg+Qy8/BWS0/jzLIZYCFMH6NSnHmM
 QkxK1AIzh9aZOWyGavyIAnO7ZOym0xJCF4bXN5UQt/LX53w+eL39PV0EVk8g74r+nA/LGlZQSNl
 ikd7WflMdZi2IPsVHq/FZRBL26Uq+yIVpnUitgG9CrlokjeAAcnA5+A9ZmJQdNhjRfzlQ/lbquY
 NR5PUToFTZGy93DNBzsboDt+ujZaMTyi2bjaDYyB1Jq/uGD7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX22+SeAtsi1ld
 I+WqfAO4JDOi2NfV0lnyLU+GCwr4Gp333UrpvXbk1e//kmRoM2OHd5TK0Aa6W3JOuCplC8oa/2T
 bLuyCIViVoA91E/2z2VGlwppI7n1wxt72u5PmFe96Y9PpFBAObOKjgARHyiGz241mpRSHxc9H5/
 Ffi1GEbCi80ThzWacoGZnAiEkUj9t2Ka/yd88fEz/et0eJLa6RDq1ugbhIt9a4UHFVaSksng3vU
 fVR+yFgX0R0K20g//WiyZTlct9Zv8C3Ka2bTRsgBSgoGwD9TRMXmuW9BWKwynRbzqdTHPqmXz+z
 rRQAEa4InNzgb3vjOHqATIBxgx7XDVwJFpIwX10dcox4zpXblQEJ+n+6KyuPvwT4sr8VyD9Zt4/
 JERJs0xPr24/vTtpdbW+/Ykn+BRel0+j/h+TUhIUiyn47Vc/VYeqYT/PaKr/mJAKaqn7NZfsEyh
 l3oaqj5vnSLI8s/ayJQ==
X-Authority-Analysis: v=2.4 cv=DK0acCNb c=1 sm=1 tr=0 ts=6adbfd5b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=ag1SF4gXAAAA:8 a=KKAkSRfTAAAA:8 a=P1BnusSwAAAA:8 a=P-IC7800AAAA:8
 a=GFqr32JmAAAA:8 a=IpJZQVW2AAAA:8 a=mK_AVkanAAAA:8 a=tVI0ZWmoAAAA:8
 a=s8YR1HE3AAAA:8 a=e5mUnYsNAAAA:8 a=JfrnYn6hAAAA:8 a=uf6nnPeBmoxfmv3DkCAA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=cvBusfyB2V15izCimMoJ:22 a=D0XLA9XvdZm18NrgonBM:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=f02Ha7HRcztGgdyUxOxW:22 a=IawgGOuG5U0WyFbmm1f5:22
 a=3gWm3jAn84ENXaBijsEo:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=jGH_LyMDp9YhSvY-UuyI:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: _IQu0762bB-Ga7yXKQGk8yyl8d_0NKId
X-Proofpoint-ORIG-GUID: _IQu0762bB-Ga7yXKQGk8yyl8d_0NKId
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfXwZBZbmrg1yNv
 sabMPdfr106k7MhRZRzmS9ayMngbsot5ib3nJb8UT1mvTaZVceiloOGPAi3sDKZ1aDfZ9C7iinX
 6vsNfLNDJXvfbhi0+zDoPXsuCfDyjHI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240001

Both DisplayPort and HDMI standards define a way for the Sink / display
to notify the Source / host about some kinds of events. In case of HDMI
it's as simple as singnalling changes to the EDID. In case of
DisplayPort it's more complicated and requires actual checking of the
DPCD registers.

Currently USB-C drivers don't have a way to deliver the IRQ_HPD
notifications, leading to missing MST notifications. Provide necessary
plumbing to let IRQ_HPD events be passed to the DisplayPort drivers.

Note: the Yoga C630 UCSI driver and Acer Aspire1 EC driver are not yet
enabled to send the IRQ_HPD events. Both of them would need some more
reverse engineering to find out how the event is being reported by the
EC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v8:
- Moved the OMAP DSS HDMI5 chunk (Sashiko)
- Link to v7: https://patch.msgid.link/20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com

Changes in v7:
- Fix build error in drm/msm/dp, forgot to squash a patch
- Link to v6: https://patch.msgid.link/20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com

Changes in v6:
- Corrected indentation of args after the function rename (Chaoyi Chen)
- Reordered / rehashed patches to be more logical (Chaoyi Chen)
- Fixed build error in the OMAPDSS HDMI driver (Sashiko)
- Fixed IRQ_HPD vs PLUG interaction in drm/msm/dp (Sashiko)
- Link to v5: https://patch.msgid.link/20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com

Changes in v5:
- Renamed drm_connector_status_extra to drm_connector_dp_event (Maxime)
- Link to v4: https://patch.msgid.link/20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com

Changes in v4:
- Renamed drm_connector_oob_hotplug_event() to
  drm_connector_dp_oob_status() (Maxime)
- Reworked commit messages, explaining what it is about (Bjorn)
- Rearranged commits, making them a bit more logical.
- Link to v3: https://patch.msgid.link/20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com

Changes in v3:
- Fixed build error if aux bridges are disabled (Intel GFX CI)
- Link to v2: https://patch.msgid.link/20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com

Changes in v2:
- Change irq_hpd arg to be an enum, possibly desribing other uses (Toni)
- Account for that, chaning the API accordingly (with_irq -> extra,
  etc.)
- Wire up AUX bridge notifications
- Link to v1: https://patch.msgid.link/20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Robert Foss <rfoss@kernel.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
To: Jonas Karlman <jonas@kwiboo.se>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
To: Francesco Dolcini <francesco@dolcini.it>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org

---
Dmitry Baryshkov (9):
      drm/connector: report out-of-band IRQ_HPD events
      drm/connector: pass down IRQ_HPD to the drivers
      drm/bridge: pass down IRQ_HPD to the drivers
      drm/bridge: pass extra events to the HPD callback
      drm/bridge: aux-hpd: let drivers pass IRQ_HPD events
      drm/msm/dp: don't take extra references on multiple plug events
      drm/msm/dp: handle the IRQ_HPD events reported by USB-C
      soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
      usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ events

 drivers/gpu/drm/bridge/aux-hpd-bridge.c        | 11 +++++----
 drivers/gpu/drm/bridge/chrontel-ch7033.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             |  3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 22 ++++++++++--------
 drivers/gpu/drm/drm_bridge.c                   | 20 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                | 22 ++++++++++--------
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            | 12 +++++++---
 drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c            |  3 ++-
 drivers/soc/qcom/pmic_glink_altmode.c          |  6 ++++-
 drivers/usb/typec/altmodes/displayport.c       | 25 +++++++++++++--------
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c    | 11 +++++----
 include/drm/bridge/aux-bridge.h                | 13 +++++++++--
 include/drm/drm_bridge.h                       | 31 +++++++++++++++++++++-----
 include/drm/drm_connector.h                    | 24 +++++++++++++++++---
 20 files changed, 158 insertions(+), 66 deletions(-)
---
base-commit: 725953d4da85cfb97a4c309fad6346b72f8529e7
change-id: 20260414-hpd-irq-events-e72bc076a5f1

Best regards,
--  
With best wishes
Dmitry

