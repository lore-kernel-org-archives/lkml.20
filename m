Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61682485956
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865131; cv=none; b=Hz4GzSGdq1YQ4KsMlunyvSklx9ym5GhftSzH16hyPqg8pUCi8XcfMMqso+zA/sCMCJubXotAl55GF6e8Owsmq3CHCZScU4/l6wVJ3UzpaZghco1PThTik4GXmjYuuCOb8DugfUUHayGQX57Z+6b8k/J+PubyUnqcSq+J1pmAcD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865131; c=relaxed/simple;
	bh=YWcagTm29p5qJnhkx2n+r5zM1nNxqP9qfROusu1U1MU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HOeh9WkfeWd9Lhwuwwy/X1gPwl8FVLE5VyI7mFJDcjou68Ldgjv9YBKsw3w6GRB+TUmiy4OYyepKNNxvq2uUdsEWDcl0yPIupwM28NJwdu1vDGKN1uJPPiyhQRrmpAZL6vRZe9+q1CCA9QOER42p+uDymUMmqtYxlb94hD6UFYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGqrN62r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JRhslXMi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGqrN62r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JRhslXMi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Dj7Is2188696
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 14:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X65urE6pCi4HjhKWTTcbc8dQLF4W93p9tRsN8DTwgwI=; b=OGqrN62r8dbb3fEp
	2hZ6FTSNhZU39JMJS13y6y8T6sQWGOWcjPfLhjI1WtFwoHhY6+dATFEmgdJ6LNgR
	yzgk9XJzhyL5dyMs5k3s1anYHC8FICec4AlKaURDkYancMNIOQAd7K3FMSDbZ44r
	fHkmxthDG4st11w7hzKLRlrX+VdCrkN4yiX38KebSsPHldWVM4uG+AhG0+QFPTyK
	2ZhfYZHZblXe8JG8NkpOeBFR/aze89lfRUCBSSHOPY57doCtdLJm4esqE2cb46/F
	0i3/aNbTuEjNT9vxbNLJlUipXiMWwKupLcqrRo+UdnF0ZOIJ9c2PXqNbuZbDHQ3x
	q2sQuw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pjcf7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 14:32:06 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c07f9547d9so63187137.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790865125; x=1791469925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X65urE6pCi4HjhKWTTcbc8dQLF4W93p9tRsN8DTwgwI=;
        b=JRhslXMia+Mlttm2hKfB8G65K36PgX2sr7q4LeLf4QBuexocghOnuJPyHohj2VFtaP
         wKIPzA4Eyhlyl2QtEbJ8VcbdTeRkcHSqmWItIwkrUIbG51Sz34rBMpPFHItnfTDGIgR8
         qqD221WvBFzDe8joc+sww9oKfAAir+YUnocBgYyni1JIxsl8NTUUuyGgp5qTxsKYNxhk
         nUmbQqyJDdn17mu0gJdBHeFssxnY2LUumdGU/GOw3sEAVfnAo5uilIGMh032WdW/id2o
         BuFIbRU2p5UgntQleeEniV+8Ybdv3/D9KRmpW+gxk4+3JYQ9xOJhWrGQFyXTfF5STMm+
         htnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865125; x=1791469925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X65urE6pCi4HjhKWTTcbc8dQLF4W93p9tRsN8DTwgwI=;
        b=0jFP05TUgmtG5n+0002LEQ5JvKWPPLQKOnsDrN8VlAckxZOLDxX1ZhZZOw6xa826ZF
         Sf4Q7ac95lMowBHOv4/RM8JFFf9Uw7GHvlcRWJNpJdeIX2Sf/NkCWzH+Y0GkeSDTBYy/
         sWstloiweTOSZnKy55Msu9n8SanCFMRlVMsKm4voemv6U/M0x+Yku6MCxpXykOj4Fjdj
         lkwnPZ5Omib6DDOXlWGFucMc71H00ODozWawUNcXfDy+KLsEh7ZcJaRU3MyrWsOvVTBk
         +EOcESsUd4sLpvuBArx1K5sNHGymC5SGnK2xGaXGPKy2DUaUqCiNRqu4iHmWFZvNuP3R
         m29Q==
X-Forwarded-Encrypted: i=1; AKwUvBxznqVaB7NEsTQhdfy7aK1wefZSDpzt9W0Zyu925rSdnw22I8jCXDCxInfP8Ek4neRPhhc2QRWFbre/NPY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+fygEJ8IeoTCdt3uXUAVvHQ/8XC/IepXe5VHKByu4d81GOPpp
	ZTrQ4gXJwjB4Or8MWm2OHP6z92gTTVlewEPNg0piide2i4Dtl9rFyBXSA3hHrYFj2a3Tizua2Jx
	oec0P10LogW8OccYuIEE5xK3E6HqRAme6jXWTI4TWNlkba2A4jhnYhNUbcUFv+SqglYI=
X-Gm-Gg: AYBFou0/SVsgmvoWQVNV/QbpJKcSqO/nvrZIz1XQilREFsHQW6LNmGzDUGyCygFheZM
	09JupJgkmV5YP/qQxdTEtlNlbTgbi/P4cIDqzsynN58quPXLpmJupfM9GnM3vEQTAbj3MNLGqiz
	86M0I0D2Wh7EVx2F++qffzCypeIOT296+/Td1pllZe+ZMpePWJOdGl427th4SHikYWsqXjPdA+x
	9SW8Sdyx/aDNeYfKWZ19jmkPyQjMhWFNwmF4aaD66S8VcD1tNUrTEu0kBEmnZQLdun3PLI7rfzY
	MPAdrKufVXsQMHFRrGxEjg7aOtrEG1yXfrzGpfrIEdRkPnRosSq67557/27QJ14mR56/Wv4opSf
	fSStBNefYLeZ/m08bE8Y5iVaSzni9
X-Received: by 2002:a05:6102:6a91:b0:7a2:2a4c:606a with SMTP id ada2fe7eead31-7be729b71c7mr1290575137.15.1790865125333;
        Thu, 01 Oct 2026 07:32:05 -0700 (PDT)
X-Received: by 2002:a05:6102:6a91:b0:7a2:2a4c:606a with SMTP id ada2fe7eead31-7be729b71c7mr1290564137.15.1790865124851;
        Thu, 01 Oct 2026 07:32:04 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027276b6fsm321855e9.6.2026.10.01.07.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:32:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 16:31:48 +0200
Subject: [PATCH v2 2/4] gpio: shared: gracefully handle no-device lookup of
 shared GPIOs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-gpio-shared-fwnode-lookup-v2-2-9a40681713cc@oss.qualcomm.com>
References: <20261001-gpio-shared-fwnode-lookup-v2-0-9a40681713cc@oss.qualcomm.com>
In-Reply-To: <20261001-gpio-shared-fwnode-lookup-v2-0-9a40681713cc@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1573;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YWcagTm29p5qJnhkx2n+r5zM1nNxqP9qfROusu1U1MU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqvm7bckSZ1ybY+o//FlZDq/jTtSz+dIe0sFgLf
 ckeiMEZXbiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCar5u2wAKCRAFnS7L/zaE
 w6jrEACMGUiniK0U8wh/NiIcHtB5aUyJYoxD1cYjoMCf4ahoj+bUA6SljzCnmgdhAT1wSWsvNNk
 3p7KxOxGj+xYFJUGoPgK7kdAgxzxw90Ie/tHYJWk5lAq3/PAXYKuE+QmnfuhhfQ42Svuus8BSII
 I4jEd5DJjRFsl7nMKQaCGecRKoYEMPaMkiQticpPD9vaC1WuGfC3VglrdPMzy74HBVxinJuo1oX
 2VNf5Rzjor77EkC/7aiwSPDmGYo2hpLK2SNV7Xb4n+5+Q+zerAc+tzYIxe2mrTyIlx8lh96Al2K
 Ib+TY9h0HlSzGi6kljlq5NUXwlX72Y2RTf0sMA8OBhXoFdE2SecJoN2wYEkjwaCzcub9kcbK7Al
 xLKekx14hU2VLBk4PD05BvDtAazNPnz9hWHIT/WqSVV1DMbJLSfE3GQ0ZAL47pebTCLuSrpfD1n
 Mavz0rwmitllhjeUiTlvUjjTUrfxYHjhU9bShFux3PaZ9emTJnsGmo3a4t2kTwMzcKGbfOMzvOA
 Hk0E9mrTSI4j1iyCPEE7+UUcarGqaWKTnvjEomlDrLPSylF6AlE0iDtHg7HMxu08FvDNMUB6v7/
 jN0SXpftUjRID6wqFYShz/Bv9mM3BYLaOluZHOyDKxQo3jSTOl2aF5ZB6n9j/Po2brsYk7Ig8Se
 HSY3QKg88aZz8YA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abe6ee6 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Il3CDtT01e2KgOc3ggcA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: TKn1ZdJRxCKx7DBJra1VPZJe9eKh_LLK
X-Proofpoint-ORIG-GUID: TKn1ZdJRxCKx7DBJra1VPZJe9eKh_LLK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1NyBTYWx0ZWRfX3UZvtoIFVCJi
 /PPFYoavtTo3XIv7iP0ESiPQ35bQZM7LBX2C2JmpnRq02+KsRcHl9x84uh0xNa4AGMMWe6pNnr2
 lZTRHCp+1UH27R5uU78xeZvfooHfKuE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1NyBTYWx0ZWRfXxWnbiobY6W3l
 tIkJeaYaHKjaNLtNwa8RE+w1rRjcEG8CNjIFYVImfFWzjGpr0edFCp+29MDLAQiztDsgxUPZPbL
 7aiCqM4yAiGjNrkk8YdnQ5b+/590LBnDAgXGBjCPqTEgusR5X4xA0Ri4usBghaULmE/4ShgDAl3
 z+Wu23UDjG27fo6TqjM+qxYT/4e1ruK2mbXYjFlb0QbNwly1nwD9IoXF1snmBM3OPqodFrqolJm
 nVpET+rp2gUcvnSz5xgO4galvtjmej8MH/IWWUCDwq3ltx68eHOWL7/XSpjzWR8AUFPaoVssJ56
 LnXqCmFVtNvMrSvq4y3O+jEWVKJKW2R2xD8+3OWmL4vGBTe6nB3AqJCRtAd0ZGPgkHxgMBPD3a8
 XporPejheMcdEttXK45GkmJ9rkM680j2V5ip986rxijLYrPtemVPwJdOBmT6Y4e5wwO1ouWgbIK
 wWUj2Tfm6JNK4Ijs0bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010057

We use platform lookup tables for shared GPIOs. This mechanism needs a
struct device to work so fwnode-based lookup with no device associated
currently causes a NULL-pointer deference.

Adding this functionality will require a larger rework and it has never
worked anyway so add a check that allows the kernel to gracefully handle
this situation with an error ahead of implementing that functionality as
a new feature.

Cc: stable@vger.kernel.org
Reported-by: Abel Vesa <abelvesa@kernel.org>
Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 6acfec73b73477245c7e4c593f2925efbc8980c6..8c9ac9d9330490b17fb3936b8758beb97a308a15 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -449,9 +449,14 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
 int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *fwnode,
 				 const char *con_id, unsigned long lflags)
 {
-	const char *dev_id = dev_name(consumer);
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
+	const char *dev_id;
+
+	if (!consumer)
+		return -EOPNOTSUPP;
+
+	dev_id = dev_name(consumer);
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {

-- 
2.47.3

