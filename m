Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09694189DD
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 23:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791414785; cv=none; b=lyIsSkB0Ff+ejBdlbxN4QMdSOy1IJCue4pgl9/vN6hWHrBJ/ctjjENWmAnTZ9Cg7+MtgepcpUzU53t8V6QJryyCEY8J2+yPM9XPMWhQ5PqHyxMAB11J+KSUucTRLMeWie9E5toyB1sb3ihm5Neh8/RdnVwZ5gm5bYYFspZIiS5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791414785; c=relaxed/simple;
	bh=zEM1ovL/bP837dH5lEcUwh8szL3Skr36tyaS38zid9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AcmILhtKioYoncAVw9bK+VOhBGSQbnWZ4Tax0EXTvyg4dZk5MUNwKr+OxI9KrTTEEo3QDmBYWH1QoeaVdX2DLvZomLFl9D3AMSatdTJjgGVFfl8XSYL3rwdSRhHb8f6Qrg46XK2gUmcC+TOnL4HmPptM7SBZPu8/l+1CgevE37g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aOLsbeSg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZZQnTRfk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aOLsbeSg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZZQnTRfk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697LtbdH977064
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 23:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tiucDzei4KDygRgMMuXg17
	uNZUu15Go6LI+RNEmPowg=; b=aOLsbeSgO8+o90zcIuBo8ctoWQNyX7P19n+kql
	VDzWWzBDhVbV9wcAYixMXDApSm0dYoTV772V3bXyPZ0Y3osgOTGSztjHHa2OTXvf
	lG1n3Wb36Y9i0yAv9tzCILBZu64NOZIqjD22bbM6R1x7U6UHStp2ErYyqMmiRn/u
	Hl5MrrFyPS1QCjx1d6Sf9oUAS6bjNM4Ay7EkRCO6crBtge6lWoMrjq9+SdP9/cVI
	2P5/8bJE+ir/3BKZ7uqBhK+mWBM8iEh3Jfl3uGnjceE8zrelLwGHfdz66C2iIP5w
	Hf7jkQVnZs7zU7g+dp1s3FjJz076jTR9ym4Rr0k/8+LlPn7g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe386re-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:13:02 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34e676375d9so4686474eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 16:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791414782; x=1792019582; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tiucDzei4KDygRgMMuXg17uNZUu15Go6LI+RNEmPowg=;
        b=ZZQnTRfkV/AgVOQhsiaYUjmL32f437kBzEUKwR5BZr9tfNgv9AXv4nuRI8Jvc92Ng1
         asj0EbkPAkCYjF7isDkOMfcYdfycnAd3OaQDVUfAmtpvZXaMFON6dOY/zGxB0Vgl1vs1
         gdijtLUU5wdWKj2KgvwhX9El5pXfmrqkzdh1bkCgAeP97LGMd8Y1KezIah+RtwTElsZF
         RJw7Yunm1KRh4MMkkA/Xl8BO1r8QO9Hzq2anRq6BC6XctrAQb3VlXSwHxbrokdQs5XRK
         3wfi7dX7KWYu736jcZxc0fphIsn9XI98mMmIhwlLMb/nKI6oaXuY7K5hmxKx7O9lFUeq
         MXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791414782; x=1792019582;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tiucDzei4KDygRgMMuXg17uNZUu15Go6LI+RNEmPowg=;
        b=PHTNyCBb70+2aj8NjBZ4RgTHx+muncKfSngNXd/IH4RgwXnyqp/JLhyC2QAh0Tw1Ax
         POvcehhvbt3wXbYqe6oyRRtpdaM88xoiRAAEYMy8uZ10Q5lLI/stb45fcR63wmQZnuqv
         JwxXCQp2IgHmW7Gv2ONbZMRNyK9AvEUtrEL23XVE3GfwVUcCjE4l4sC6OwGTyGr3iLBI
         N7g5LvVpshPS52k8u9UhH8xpHNLgHtzQAkUu1qov5qDUKekA5FgyD5TYHXs3KOcOY0kg
         FZmcB6a9ybp2L8hWVWyZcWEARE01hGDl+HEHhBYtZ107eAVCEnrGD3Dk2HKFJdS18deX
         tupw==
X-Forwarded-Encrypted: i=1; AKwUvBzLtWuOiUR0pmxTUOA3jmEcWQFne7UUOk3i8plsFGfjsMwX0L8cHZfuZ7iUsHqqYxMC0KyGK4AItEoXGLU=@vger.kernel.org
X-Gm-Message-State: AFuF++nVscT1mYxot1Ro38b6uFqdGBc7WBLtefRyDhDT6QvTvxuZqeY0
	Z1/LRxc+yH6T5bVQZeqUECqvp8CSSB+a67z+DkVAoL0+Nd32X2ucV6gaNPSnDyIIYCv+jCQUS1V
	UziXytXsUQkejBGIk4w1c8cbzYigqxbiPtnuuYy2juZcbo2VFe61Rh5ZI8tAFURkKoMVH9pXI2D
	I=
X-Gm-Gg: AYBFou345/0KCL/7H9PQopSauNaDzWs0epZFbfY6eC7l2qGSGq21sDw4Gd1icoRQEdq
	aL1VnRIIrAow7CbOpDV2++i2ddAVtTcu7iVDrL/0ut2B5H3uZlxLHyVaJUAWg2+kc0mcRE9pkdi
	27jG5ohTONaGk6kXyr8Cd6Pv19PhuiSFsNiJ+rNQrs99qfAWy5G4CAG/hbCqvjlPFtRDHV+wXTo
	a0w6Y4DfwR8fDCTiT1dlSBZesC8e9zTlf2602xY6NCYHKQf1ajSyBmPR+di4b1GMcG62g/FQ32D
	s0wmOYd+NbHsR2ipztH30dVyH1kFBrLQBB/hyY1JaA3ok7F0yQsyqf3dK1n/z9k9LnkgD7xh+sK
	rWya/J1nKId3W924oJUww0P/u2yY4rtna0UhVUZGVK5xEQkO7jJsn3mE=
X-Received: by 2002:a05:7300:de04:b0:351:5304:ea51 with SMTP id 5a478bee46e88-351774a246dmr817586eec.7.1791414781964;
        Wed, 07 Oct 2026 16:13:01 -0700 (PDT)
X-Received: by 2002:a05:7300:de04:b0:351:5304:ea51 with SMTP id 5a478bee46e88-351774a246dmr817534eec.7.1791414780958;
        Wed, 07 Oct 2026 16:13:00 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515abb779dsm10095183eec.1.2026.10.07.16.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 16:13:00 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 16:12:57 -0700
Subject: [PATCH wireless-next] wifi: cfg80211: fix kernel-doc %field ->
 @field cross-references
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261007-cfg80211-kdoc-v1-1-157b358b291f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPjRxmoC/x3MTQqDQAxA4atI1gYy40+tVxEXkok2tIxlIiqId
 +/Q5bd47wKTpGLQFxck2dV0jRmuLIBfU1wENWSDJ986ogfyvHTkncN3WBl996xqpqoJNUNuvkl
 mPf+/AQ5N8hEzjHJuMN73D/u+T99uAAAA
X-Change-ID: 20261007-cfg80211-kdoc-28934c035d4c
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac6d1fe cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Wi9NdX77-0drUT_YGWMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA5MiBTYWx0ZWRfXwtC9nHMIe/3o
 Z9ciRwcaZS8MWguJlk64m3/U4655Ly9ghTPeoHYZYoIS+oNyQ1vBxpgeIqMQophBY5T3aW7Ho/t
 MEv7hBZH6nLKsmmRmJZBOOxZ/R6Fqh8=
X-Proofpoint-GUID: MxuLdA1DAHrOK1aMkuw-p42H5DOFHZgy
X-Proofpoint-ORIG-GUID: MxuLdA1DAHrOK1aMkuw-p42H5DOFHZgy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA5MiBTYWx0ZWRfX8TsiSe1ZeeWK
 JAVt49uXFODucVFo2EafuknQ8fdm4ZByE693hp1LM6vm0j/6aZCjtuVYYE+X6I2iQXQEPvqVUzG
 fk1GsYp1FzLt4ZVni+aTM26rScGdwEQnr4cC2OcL3zwZYoJ4bhHDSCSvOQhAvDqdhgiHLyV/T86
 AdUbk3afIO2ldof4Wm2aC+fSjMt6pqbVkUHvigQp0v8pYXaAB3tSHGBCufqfmKU8coo7ETKmLTk
 Oa0GgfzNI7UWg4cf4Mz/+70QZLx8nTurrMjeFXOWpFNXYGsgbrl0vq5yIwtL2m+g4ZTt9Jdm/dr
 OV74Nds21CvIoYvt/uLtZOK+T5q2S7bwd2om6vCU+sAmCp5RVdcCrVxf4isYeDCc36WiT97yd9s
 wuPw2qBxJFitZJoOrHLQknVsdMFa8YiaZRwGtO8KKxopu1CR6lUfhGors3GoQGJRGy9qTjYWDeA
 dvbaFY9kUPKDPY/7apw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_07,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610070092

Struct field cross-references in kernel-doc use @field, not %field (which
is for constants and #defines). Fix eight instances, while also correcting
%elems -> @elem naming in cfg80211_mbssid_elems and cfg80211_rnr_elems.

Assisted-by: LLM
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
Spotted while doing AI-assisted review of a new feature. At first the AI said
of that new feature:
<LLM>
The series uses %fieldname throughout cfg80211.h to cross-reference other
fields within the same struct. The correct kernel-doc markup for a field
reference is @fieldname. Every example in the existing cfg80211.h file (e.g.
%duration_mandatory, %parent_bssid, %elems, %nan_channels) already uses %, so
this is actually the prevailing convention in this file too — it is
technically wrong per the kernel-doc spec, but consistent with the surrounding
code.

So these are wrong by spec but consistent with the file's existing practice —
not something to flag as a new issue introduced by this series.
</LLM>

But I pushed back with:
you say that "Every example in the existing cfg80211.h file already uses %,
so this is actually the prevailing convention in this file" -- is that
really true for all stuct member references?

And AI had to admit:
<LLM>
That was wrong. The @fieldname pattern dominates overwhelmingly — the grep
showing 226 @gfp, 182 @wiphy, 133 @link_id etc. are all cross-references in
body text. The %fieldname pattern for struct fields exists in only a handful
of pre-existing spots: %scan_start_tsf, %parent_bssid, %parent_tsf,
%nan_channels, %chandefs, %elems (six instances across the whole file, and
%elems is actually wrong — the field is elem not elems).

So the correct conclusion is the opposite of what I said: @fieldname is the
strongly dominant convention for same-struct field cross-references in
cfg80211.h. The new series uses %fieldname throughout, which is inconsistent
with the file's own practice.

All same-struct field cross-references in the new series should use @ not %.

And I retract the earlier claim that the file consistently uses % for fields —
it clearly does not.
</LLM>

For punishment I made the LLM change the code.

And now there will not be any use of % for fields in cfg80211.h.
---
 include/net/cfg80211.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 05c625d9e076..725dc8053727 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -1410,7 +1410,7 @@ struct cfg80211_mbssid_config {
 /**
  * struct cfg80211_mbssid_elems - Multiple BSSID elements
  *
- * @cnt: Number of elements in array %elems.
+ * @cnt: Number of elements in array @elem.
  *
  * @elem: Array of multiple BSSID element(s) to be added into Beacon frames.
  * @elem.data: Data for multiple BSSID elements.
@@ -1427,7 +1427,7 @@ struct cfg80211_mbssid_elems {
 /**
  * struct cfg80211_rnr_elems - Reduced neighbor report (RNR) elements
  *
- * @cnt: Number of elements in array %elems.
+ * @cnt: Number of elements in array @elem.
  *
  * @elem: Array of RNR element(s) to be added into Beacon frames.
  * @elem.data: Data for RNR elements.
@@ -2908,7 +2908,7 @@ struct cfg80211_ssid {
  * @scan_start_tsf: scan start time in terms of the TSF of the BSS that the
  *	wireless device that requested the scan is connected to. If this
  *	information is not available, this field is left zero.
- * @tsf_bssid: the BSSID according to which %scan_start_tsf is set.
+ * @tsf_bssid: the BSSID according to which @scan_start_tsf is set.
  * @aborted: set to true if the scan was aborted for any reason,
  *	userspace will be notified of that
  */
@@ -3168,8 +3168,8 @@ enum cfg80211_signal_type {
  *	ktime_get_boottime_ns() is likely appropriate.
  * @parent_tsf: the time at the start of reception of the first octet of the
  *	timestamp field of the frame. The time is the TSF of the BSS specified
- *	by %parent_bssid.
- * @parent_bssid: the BSS according to which %parent_tsf is set. This is set to
+ *	by @parent_bssid.
+ * @parent_bssid: the BSS according to which @parent_tsf is set. This is set to
  *	the BSS that requested the scan in which the beacon/probe was received.
  * @chains: bitmask for filled values in @chain_signal.
  * @chain_signal: per-chain signal strength of last received BSS in dBm.
@@ -4246,9 +4246,9 @@ struct cfg80211_nan_channel {
  *
  * This struct defines NAN local schedule parameters
  *
- * @schedule: a mapping of time slots to chandef indexes in %nan_channels.
+ * @schedule: a mapping of time slots to chandef indexes in @nan_channels.
  *	An unscheduled slot will be set to %NL80211_NAN_SCHED_NOT_AVAIL_SLOT.
- * @n_channels: number of channel definitions in %nan_channels.
+ * @n_channels: number of channel definitions in @nan_channels.
  * @nan_avail_blob: pointer to NAN Availability attribute blob.
  *	See %NL80211_ATTR_NAN_AVAIL_BLOB for more details.
  * @nan_avail_blob_len: length of the @nan_avail_blob in bytes.
@@ -4276,7 +4276,7 @@ struct cfg80211_nan_local_sched {
  * This struct defines the set of NAN local schedule channels that must not
  * be evacuated for concurrent operations.
  *
- * @n_channels: number of channel definitions in %chandefs.
+ * @n_channels: number of channel definitions in @chandefs.
  * @chandefs: array of channel definitions that must not be evacuated. Each
  *	must match a channel of the current local schedule.
  */

---
base-commit: b6f009284138884c4b07bbef7b07d780aa9b5daf
change-id: 20261007-cfg80211-kdoc-28934c035d4c

