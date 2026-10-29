Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279381;
	b=pbfeay0TOrB+ly0K8wPzVwRzRO0WZfujO4jMJsL43qOsL+GqHrFfTgc3xv92ZnQHjPBN
	 G17wz5TeI8uWRsOJBQqIsfcYrl/VdePpZLLEutIZwBXWN/kgOVtipaF1BlL0UvxHvc1qw
	 pmoH4EdQ2AkW+soFNZGSm/f7e3MDVt5B32U1mtrojNGlqbgwY6KfxxdW36DRGHTRfyfMP
	 HiXe82QVA6D6WGE0uEuZMLD9JzMqvdFvWRSTiWP+w15kubmiuBNs5MO7qfLOGRixHdXRU
	 N0Wdifhtj80+rRn3hcGiTph38feU3a8qZYyvDXCaZ3GIzo9WTXyLeugJYQQWkPEr11A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279381;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XFgV7hQHnaqB3LpunHXmA40D5cDU+9hyfeWDV11nSSI=;
	b=UuJUa2XLiuAcJFqXuFxIBy+Dd7+DY+h5A07ynXQ227IyjQOQMVXXd2QwmjEl4FWS+kCN
	 d6uTPS0qMdeDEi56QAkoKBQiiTljq7vtCTCPw+2Jgt/3fzKJs4agx6y1Bis8YZGEWaQpP
	 s2nF9QUGynKnNgShdgcDch9Kb2Qr0+nONqbST3rBNC8yP7Qfem7d0yeKFfwMaagU/R4Uy
	 0B14gjfv28cj/N2/J38PzOG+jRMvf3XB6N7dfhgqkNKPdFCE2m+zlameGfXco9T//69mk
	 I9sbuRqE+tVSbr7WrFrbY8UZUk3qeUQhOsm159g93fbUkdDEqrAuEPmoS0O0WvveXNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gzlnjI0J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZvWP7mIO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8BE606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F8BE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gzlnjI0J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZvWP7mIO
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCdxQI067944
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XFgV7hQHnaq
	B3LpunHXmA40D5cDU+9hyfeWDV11nSSI=; b=gzlnjI0JD3BTnchNvTSWFHIyEB+
	0+tMXKU7Fd1z2nbjG0g783Kw0aKRHyCF/3WUkeNLH3EQ7Q5LPGhIljqUrVro8j/g
	3sVBzqUPEBGgXewhRP2BCpFA5nwFsuwnd6gS2aa8ebwJ4alSr7891ak0FVD6sIlv
	lAvmjdsGwsdLGMqEhK6q6+W0NQQ/GNrReFRehKhuUd1gbWrbGkq406CTFXT+vy8f
	2YjyIF2pyvOFWyekE7EtH0+ZbtgSH6RvhuI+a65JDkUdCRR++5ezKdLC7TFFLeO4
	BLDMeHYcOIRN/WZe+fXL6w6y81VyihJgsDhWSLQJTUdtIDmt7BkWKG4GTyQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkxshsvd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:09:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so2063329a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793279378; x=1793884178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XFgV7hQHnaqB3LpunHXmA40D5cDU+9hyfeWDV11nSSI=;
        b=ZvWP7mIOxekQcq0Tkwqcf/0CuSiIopGLEdyPSY7AgBSHbPRzLPWiEaxY4qTF7qyH23
         1/y17Sn9CY0m/dgfm9Iwfc3+hUmZ8IJfttAe+a0qxZuJiyrDJ8EzbOmK9YAz594e5ElW
         rp0d/OknKvlTEXc7nkQBRZhf0zruMxNF5eYGP4ZogIPlWlRQrXzXskZWkJRkISBJqVBc
         AEos7m6Fxgosiuim9E2Aeib99Tj1SBnpD7qJ3Ot7PgIsJPGaCMbnxQ9jra8mcNsIedKk
         XMLdQ6mMoj6QQc9gVHAx9/JPRY4ZLviV7Dwuf19hyn2ucIIzHhmRsues3EgmdRssAnSB
         vX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279378; x=1793884178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XFgV7hQHnaqB3LpunHXmA40D5cDU+9hyfeWDV11nSSI=;
        b=BpSnpCroXbD2Dg3PzQiPFBCilo7yAaN6DF6+6VPARfy3rOtZ6DyVx/ovS3gK6aR3GJ
         3sK81OI0Ik/vL6UVeHfPk1lgwfDGnW1lDeFevgJSztD5Ihz6qdijEjh4i6sW3ChsPBDk
         nq3vox1IrCDWtUwdIxEEKFgQ9BzpsOwkCT3Or1BqkOlTeVXSJwTMKMhSzs8VSUIXFaHy
         tWehm5gomog1pKKLQMAsYg4fU0IYtFscsBjvue9vUtekD7BlUmQngO1VLza0GNsVbXsH
         WPi8Bj5ckZE3j84sNv001m1LPXctOQbsUxpkAXIHt6EYSSWbTxuImmFIDOz6v8rMv1xH
         H8pw==
X-Forwarded-Encrypted: i=1; AKwUvByzGB8MrBLHOC9k4nebfXwOBmlCybXAKTcoo0Tp4ydx8ZfPQppxb0Z8fKFbcDDY7FAbgJmdbr4ciINdxKg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIg7BbNtcQmFWdKQcWzyn3lsrcdx4eM/3OJCFImMggTZSL4skbe
	DbHWMcOR8dphRNYtQfHflPVzzfrf9d669cTY1wElRewiPq4ZjI8/rEUc108bSHxXdXJMg3uUlAe
	PwDI8M0X9yjVeY0lUAEFtEOC/g1Kg94R1BWS0nANuIS+LzVvVxfNQvCjbhmz7s7yMJbU=
X-Gm-Gg: AYBFou1L5tGgDBfYd2KIq0MEYw5hAoxcn1CSzwqoaZZIfzDWvnkI1KRx7tVE2BUX5UT
	rwTQ5k9JDdSQfNAtp/LKTv0LSvbgyyXh4E7UtcSUa+N1uJaJfVlA3allfnIGRG+d2rBYePM3/5p
	9gYljG2T3dvX5ck/uALswWOYm+NUd0saxIPlpwuXqJS7aEqtKY1AkQgyldgcs7CFjTIQ97QuTm6
	MX/WPmzD48hG3mDCqc4nd5yy2od7IJnpxjeOh6uy/s7uS/lGzdBwuZqXJ13qusWsjeuoWMikq37
	jmtOmN11N2BjuwQZAkUl/TehiFoNw569gDtUHGoxRNR45JUT6lDlnIJ9M5AkFVTvvMMjvSVVIId
	PpEIKiLoFH6jpKoilDUUvyJfBJdFRzeHuHG09W/vacDKy91HmFOVs9qPsUgxEVAXHg39yHGZ0/S
	Ua/fmZSEE3abor2+xk1iWyq+00OgWBESd+kca6kol8DxyL0nMNwTc8RhvTjqlRZeeMfqU37+jpp
	Q==
X-Received: by 2002:a17:90b:35cb:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3ae5817ad6emr4046518a91.42.1793279378476;
        Thu, 29 Oct 2026 06:09:38 -0700 (PDT)
X-Received: by 2002:a17:90b:35cb:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3ae5817ad6emr4046490a91.42.1793279378010;
        Thu, 29 Oct 2026 06:09:38 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ae6e973ac6sm4598145a91.11.2026.10.29.06.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:09:37 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [RFC PATCH v2 1/4] dt-bindings: riscv: Add Sspesa and Ssplcofi extensions
Date: Thu, 29 Oct 2026 18:39:10 +0530
Message-ID: <20261029130917.3714691-2-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029130917.3714691-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261029130917.3714691-1-mayuresh.chitale@oss.qualcomm.com>
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
X-Proofpoint-GUID: 2_M2TsQS4SEYKgK6p4Rbcn6GJRUYYyk0
X-Authority-Analysis: v=2.4 cv=H6BOUOYi c=1 sm=1 tr=0 ts=6ae34593 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=2yNJKbwY4VjyOEKDNOIA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfX5LP4mYvnEj3Z
 mDkmoeRyddjpWLToI8YUWK9SKi2Mzp6rxJmzao1swHc78lCeGTN0HjgV1EffI8fNLYAH8cewFGb
 rDSu58eMbgmjQylKM4d1+4d6vyzch94=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfXylJVdW5KporC
 T8c6yrO+TS0FuaJV2Veq1iVD36rO1/ZwV1NUpgR2l4L1evV5vj3saCFTPjGMGmwRR1p8gpbS8va
 F+xVbbR+NlhjAr+9T+bqlfec41nwtM9308Szpt8Y8WFnN89sdn+CE/LtPuGpOzg2YdcI+0dlXAI
 eyQbvP7u4au/TIguMrOiYfin7wrL7OTp98yN7t+yb/IikV/zckx2ckvHrnG508vSJBgE9rREHLi
 0uCzSKcfc5XL/REv+pIT5zI/PrRbQ2deZnifpChNP/I4Brogis3XXYYuRTHguaWnMcwyxdn1q6K
 S+DjcFcs1PxEs02fO1sBmpoQjS09mDCt4c/jcxFql7oIO+rbFPKgUGRjo6n5Bdhq4pUP7Y51KHn
 RPEz/FiylMwfikK5qAPNvuWwsirteO/U6+y7nZ7r3galmIiSV8f2OaUgM9PrTldcpULvAD5tn3+
 /lPcX+ihMX8ykKRfptg==
X-Proofpoint-ORIG-GUID: 2_M2TsQS4SEYKgK6p4Rbcn6GJRUYYyk0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290051

Document the RISC-V Performance Event Sampling extensions Sspesa
(Precise Event Sample Attribution) and Ssplcofi (Precise Local Counter
Overflow Interrupt) in the ISA extensions binding.

Add a dependency rule requiring Sspesa to be present whenever Ssplcofi
is present.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 577d7ae5576b..5c1c0d308615 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -269,6 +269,18 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: sspesa
+          description: |
+            The standard Sspesa supervisor-level extension for precise event
+            sample attribution, as defined in the RISC-V Performance Event
+            Sampling specification.
+
+        - const: ssplcofi
+          description: |
+            The standard Ssplcofi supervisor-level extension for precise local
+            counter overflow interrupts, as defined in the RISC-V Performance
+            Event Sampling specification. Ssplcofi depends on Sspesa.
+
         - const: ssqosid
           description: |
             The standard Ssqosid extension for Quality of Service ID is
@@ -977,6 +989,20 @@ properties:
                 const: smnpm
             - contains:
                 const: ssnpm
+      # Sspesa depends on Sscofpmf
+      - if:
+          contains:
+            const: sspesa
+        then:
+          contains:
+            const: sscofpmf
+      # Ssplcofi depends on Sspesa
+      - if:
+          contains:
+            const: ssplcofi
+        then:
+          contains:
+            const: sspesa
       # Za64rs and Ziccrse depend on Zalrsc or A
       - if:
           contains:
