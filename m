Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584836;
	b=N8ZN/Up338JtnadmL/Xj6/vbarSelzjeRuaV1t02iSLH0I3fQTsp0S7vZwpMjwrAWOzJ
	 /lf4yaS6sMlAsKgf9RAhTrI4VHlHaNINz+uwOyE+LZzZZ7J6hBiLSOtcixdQlVYloa7Xd
	 yRP3uByG49JcJY4/Y3AxQ4Em21redEv+4BdLG9ErNfzD2FgqOptZS4qFXEsxav6SQGHPz
	 ERF/V+BG9fvOTy6VuisqUsMViqfSQKtS6Udmw5/vaJBMhoNl+2q1VjIYVzrPWopSgN9Df
	 P0foWuwcR81sYDQ20PDKN5D/xg9vbObCTohOeD5+yc3K6cVGFXehBO1BY7JjTu1hssQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584836;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=p0SG/UcU30V2xHOD7lY1mRa6oni/p3PRzhrNY3Gt+7M=;
	b=z9lXgGuWLsKB32LvlLgkU2YeBB/+4nEsQCY+KwamqBSfcaL1aXvWS2cRI/1IMFpqdvch
	 aa/sPPgla+dWMO8amkqLVoMVnsISJS2vouUWzH+kh24H1V4uMs2d9/3Z1wraJvoEH+SBg
	 CUE5eE5kI5tXIqqDHYwLimafGD+FJS8o2WhOBoqnpHmjhqAxkcf7ooFThxssGHnS9M8p/
	 WByURe5XT7jhg1Vcx/N3pvDfq5TpmMnZul7U5xKYL3nYpgkKKZY3nqIoknlgIsYREJ26J
	 Dr4sQopc9iWcn9pBZJq4S+BdJ4G/0C2jNe6GSy7eLjzJWRDdR643gbirY8hqq+JQ4OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FeHmIXaB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fERmXGWD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74DF606A8B3
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D74DF606A8B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FeHmIXaB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fERmXGWD
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFj7YN780751
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p0SG/UcU30V2xHOD7lY1mRa6oni/p3PRzhrNY3Gt+7M=; b=FeHmIXaBYieL6OxG
	t6WUzojIA0ZKYBDTI8hL2F5VD7PdZyQVhoF8QNKqrS4mA4n6iJaAoIlvnhonIEDA
	Lm+z6C80W/reB6J2KTaV9ql5SlXhPCIx0S/e1r30MiTWPHpbPPeAOveG50n09PLP
	RuEIPw3JoY4Snyp2Ot0CQeamBYdrL/vpaJhgvLr7vb1zRDmqN3+qLw5Qv2PHPH1t
	yxSb3kAX74B/PyMVEmo+5VPpHHmddiEpPW9fk8EJXJL1zCoVNbtxdD9EsGtunU6W
	u3bby84HVmXrzZcBZKmoCOZT82WZuuh5ycecA34oL+5vjPSErYRuu7pShRxq4WKK
	h4OyaA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37j679-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:47:14 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2c7428eb2so203622137.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794584829; x=1795189629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0SG/UcU30V2xHOD7lY1mRa6oni/p3PRzhrNY3Gt+7M=;
        b=fERmXGWDKC0DFc7eNl9p5nCD6MopVh5rz2Ybo37Tqlpo+aADJJOZv/f75BAZXxEWD9
         Ic/NY6NZhPDOS7h/eth5157Gqjpuxvexwa65cTrq33NLECDW/Tuf6TMC7x5rdqr1R/A6
         WuGxWPpE3IXnfP04pTEouMJUD3Jdh7aKuBy45zCVPr0bAFstXwVJ4Iuj59Q4kE8e+nuV
         Exht0CXXnyybMB9MFskXBGWVFZV53Kk2yQbB4rvEgflh0P3CS+a+pv/zc94KkPPuAuwp
         WNHRgCa/DtDFZEnZ1iU5XuNsV/5oSCJb24YbqJUZoMyvSvtNDG9CnPX/hKz2XcmGpdqT
         UmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584829; x=1795189629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0SG/UcU30V2xHOD7lY1mRa6oni/p3PRzhrNY3Gt+7M=;
        b=xWSxRW8rsYZNTT5okF9vAYqUT8kKnIIrrPTHwgBqrlzSG49gkoX09RaycMA+OnQYGh
         tcqwJ2vc2/Hr18VyxVH6vBg6S84h0ey4AwAyZIwdTFyTsTC+ZhbTU90gOid0p3Vf8Ua4
         W/3qDXwgdXqo0MkMCnSs1WV4vn4NcYYKqnuC0zJ2ZfzusUebzVJotOKfbr71DIg8YxUC
         GJToRrFprvps7YkeyO71vyc10wDiX7WKNNPSP7jzAHnI2tn2iXa8HZvf5QuxBoDc4AOO
         gen7PvubHina+cG0fxWakl7YUPqqNyu4XTaCug/MGbLm2s6CKTAD42Eh1CpC20KD4nNd
         T6UA==
X-Forwarded-Encrypted: i=1; AL+hErGoGqHAyEqPKt/Xb55OHcnCQAa3NH9QXwPpta4aHejyvlWFSBIcmZDJq5zIuQOyowZ+/YIRQxZxGqouQI0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gae9xQ/D5D8XsuFy8uDsqZBe80ylNkUIO3DOI9rNTEn76Kp76
	LH4bMHhYLkROErKHBWunN0VItNUUON7QRoD73nKntxgqBtD0f3/6eiY4Gez2wj/cLqQ6J4VQ5Q1
	8dcuNlcGS/UzeN7JiDFCegPNc2ntE52yz2OmCrI6LNofQE7bJz3QA/7gVvFW15jhkWEs=
X-Gm-Gg: AYBFou13h7QdxpTQpPbOkpKb3DrJ2q7WsL9jeLwK1l7pxdOUvn/SD+ENMP0KWFZGrzj
	BaD+2SvacAec2PY5Pjx55mMnMFDIipn3f5JUeJXfjV3ie2xVTV42y9md+udwnfc7Zv1X7NveSwz
	Efta/cT4agmmoGb2Nbr75PsTLU995XYPLkykz0k6CCjZLQ/xa+RQJb5m9Vz23P3qFFxTsuUF9qR
	744P7qsePZkFtwo8vBeyEw2E6qrgPlGkD2o10k8oDQUv1pyGLNNRjHSPrj3h2he2Qd04QP5GVWJ
	aMQuIKOhih41kyusbarir3crwoldOvaEdfgusA2Rs/Lyv3NOfrEOxauJVVc7gluXxCBkYulRA0w
	An42o6YGOlreAdfO5KprdVZms/qcivqD4waaaaXvitKbFBn1eZf+1wD0VhASvwl+KvVhcP9GBZ8
	NOCQ==
X-Received: by 2002:a05:6102:4426:b0:7c1:5862:a97c with SMTP id ada2fe7eead31-7d64d874efbmr691229137.37.1794584829222;
        Fri, 13 Nov 2026 07:47:09 -0800 (PST)
X-Received: by 2002:a05:6102:4426:b0:7c1:5862:a97c with SMTP id ada2fe7eead31-7d64d874efbmr691221137.37.1794584828711;
        Fri, 13 Nov 2026 07:47:08 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm5636519f8f.21.2026.11.13.07.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:47:07 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:47:01 +0100
Subject: [PATCH v2 01/10] lib: string_helpers: export and rename struct
 strarray
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
Message-Id: <20261113-fwnode-for-each-prop-v2-1-4edc23d5cf50@oss.qualcomm.com>
References: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
In-Reply-To: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1898;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=m4NpZDP9wCk6X2lLRZntvYOO4JCGmA1kZu5D+y8yR/o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9zD34fNGOw3Us6Spsa8wQXUoWktbw9LNMm6id
 xSi/+Q9T62JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavcw9wAKCRAFnS7L/zaE
 w4MUEACv2DIA4WBHencGWJ8xeH2XgSLKF7rWa1HACKBslDnGDYzgFtvP+WP0BINXGHsfU9nEWv2
 R0Zm5zbET8Gud9t2ocSRdp2QCz5PYjYlIyW0exI9eU6MQkoyCiNwN3PqBtAAeuQYsozHdBLGZiM
 DJXl8D2TQ4ZCFALyp4kaXFiFCY9CsM2DBK2FYee8jDAlx6slky2/X1htkINXkjpJhfpzrm5UIm5
 Hxzp1Wqr1jMO4g8ioJSpMqufUAeeyY/lFruejpTFY/HZtzc2jGoCVUMN4qf8hbuRGux+Q4GjO2/
 7E5wjbT/k1oSyCFHIYLZnNjdqSJ6xD7X2GOB1rE87UEqPdNY+si1LIjCgKT6WMTwJv6kP23Qnne
 2hLkvRYovnawknJkWeuffSgA+ZqI+FIYin9iG6P4ik7sHTUjsrIeNNmnbgELRdTbXQ5GmsAPDuc
 ROpFolb5danon5vtph7Z5zqjvc4ZJ27Qbifn0GTweLFQtiUDImuojNNiDaXTLLRcbQe6I5SAoNa
 gCSF69hau+bYvtD+vgR9qZVpo51TFSpCKyJYNJ8FYD++1VQGvW2v2yL4nFR822R8NOD3n1hjFtg
 cUZPDoLO6nxfU60mWZJvYgLDArvSgi8rkk/yu38ZYS5DdSNmCxcM/Fq7jv7wMlHdm5w0uTqK4Zv
 Cn/CsMAdImuO2kg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX66PG6SkXlOZT
 DquN/IN01/Wx85qFtGvP6kFZdEiUctb72Rb8L34xU7BjCEGFNUwEvYDE87g6E4HQHmsPwz5Pn7i
 toKCztXwncaHd6UOcS/5/u+ARxyXCxk=
X-Proofpoint-ORIG-GUID: J4j0bzUnwGRR3kpuzVlwQjsA1ZC85TVy
X-Proofpoint-GUID: J4j0bzUnwGRR3kpuzVlwQjsA1ZC85TVy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfXwkMhkt4jyckp
 bZiEu0p4gdDU+FW8szWGoqfcr9/HkKTo+GcGhqKfdVOA1zye3jfMdkP0nM0z9XmbduJaz3xmYfL
 wLI3exT0PzVmZC++0iiFJ8H29B0pdom/oqsNat9Mkt+UaxQ6XhWjfGkJwuwjLY93wa4Zq6/EUOk
 kbEM0wxQyjS2aCXTjNpP426tH90vGAMDyEzcCY/QdtLl+xDrXahIts8pkOW36gn6/C/hqakORwi
 Dc6G+RVcEuoDwDSLASFd9sOqu7fdFhvQUO70nUcCiHYZJ/ZQB3+QvxYCBYTS7vj8Qg5rFIk/a91
 oCFpy2VJqZw2p22nsk21kHxm41wTsDD4ARPcDXM171f8oj67kMBUS99IkqR30BcOy6pJxa4c4jz
 qVeuGZn7UAtKRshyWB7ntpCOXCtaCs1uLozJS8wgY/SIBMg92kioMuyfBU3104SMzY34X92kf4/
 CnQKmmKUaAEn3S/YiLg==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af73102 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=NBg0Ud2t-6tr7aH_vnkA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130062

Ahead of introducing a CLASS() for string arrays, make the existing
struct strarray public in linux/string_helpers.h. Rename it to kstrarray
to avoid any potential conflicts in the future and make it clear, it's a
kernel type.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/string_helpers.h | 5 +++++
 lib/string_helpers.c           | 9 ++-------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index 3fb88a1e989833ad5ea1a46858efa16e3971bf08..c9f08066439bdd33cc26e2054dbe1ba2e867aee7 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -116,6 +116,11 @@ char *kstrdup_quotable_file(struct file *file, gfp_t gfp);
 
 char *kstrdup_and_replace(const char *src, char old, char new, gfp_t gfp);
 
+struct kstrarray {
+	char **array __counted_by_ptr(n);
+	size_t n;
+};
+
 char **kasprintf_strarray(gfp_t gfp, const char *prefix, size_t n);
 void kfree_strarray(char **array, size_t n);
 
diff --git a/lib/string_helpers.c b/lib/string_helpers.c
index 98d6ed0eaab7e9f3d54e420c404629a28b925bf4..8ec7ff6dac1212fe8a1f242654944ba6e5568e20 100644
--- a/lib/string_helpers.c
+++ b/lib/string_helpers.c
@@ -804,21 +804,16 @@ void kfree_strarray(char **array, size_t n)
 }
 EXPORT_SYMBOL_GPL(kfree_strarray);
 
-struct strarray {
-	char **array __counted_by_ptr(n);
-	size_t n;
-};
-
 static void devm_kfree_strarray(struct device *dev, void *res)
 {
-	struct strarray *array = res;
+	struct kstrarray *array = res;
 
 	kfree_strarray(array->array, array->n);
 }
 
 char **devm_kasprintf_strarray(struct device *dev, const char *prefix, size_t n)
 {
-	struct strarray *ptr;
+	struct kstrarray *ptr;
 
 	ptr = devres_alloc(devm_kfree_strarray, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)

-- 
2.47.3

