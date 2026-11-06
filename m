Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793951969;
	b=5CUVKUo8PVrxtT8Rx4dthnm7L8te7wWcz24VJF+Url9pyhfrtzgslv83yZ+w0iTWrU0r
	 0diOj/PWunGayAjxD2O55/QttHikfiwi+uy0CNC6hTCa4JjhYGz1RGF6NPBYrfb3W1FPU
	 F5icXW5Z27jicTzwXbbGryBaxV3BMALf7pF7nLu/vMUMeWgTpLTSp2eCT7U6byGVzEaGb
	 TW25DuuRpVBd59yRNezsj5NdJjRREuRWvtIp+vUha6JC529gULJi+a8oYPL3tVYm1J+sT
	 Cm4BAQ7Qta1oTHO0FeWoJ2SSxbIMddPZBfDBVsekcjzmZ3rE7ndIPyAc4kQrDoqsKaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793951969;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=q99MY6Y15R2IsZRNnTlhKJlm5z/8BXTFZjWhC+CFrEk=;
	b=glmWRI8o33joA3T9H7h9EDigUvWtflBjq1QD9mDwXCU8f29tclEKgl0OPsC4TLeWn+sm
	 DtFhgdYIX0YXISkImhSuZl43hc+b2vfmGtNRcGFCSRng/9sXtTCZyaUkyur/8CaAb7UgC
	 P7kUH2Al09sSKGjGWkYOD2Ln8l3GxcLcysMKhvoWBtBfHTAoA7uza/+G+Ps5oolBCHmes
	 ulDJW64hlCT3ZWMYtvfK9IjGRJpGcakZUxXYcU3g3UXPsEfmXDhb3xNufUy9um9TsnYjy
	 vgc1kFE4J7djgSSzRl4l21vFFqYQ2PPq/PtZdMK2mOujyovwibfARnWzF2CWZp9A1PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g9Riysk0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F2is17M2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173D3606A337
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 173D3606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g9Riysk0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F2is17M2
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RlRk3883435
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 07:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q99MY6Y15R2IsZRNnTlhKJ
	lm5z/8BXTFZjWhC+CFrEk=; b=g9Riysk0XNX5OYGbY8/o7InKt5HNRsM7VcVwHx
	hwr+6dnjDR9KPPzJHZnRZlCwC7K1wWTbFcVQ9dPNtVgTkqVThZJi2S34tGRAtIIs
	Eru8J/jkhvJOlfyd5n/Z5+Hg7WKxxTuU95IfJaboEdX7/SC+6vN8hMZanujhXXSD
	W4+c24XbukpLSBF6oNE9gYhhbnZE8ewR5RPaWAfQrFel2y2AUbPMhXCFSX6mKW37
	+E6DYes9flAUoW7Duy34hElv7zXUwUIglq7PIl2JTx0/2AJuqNngne9KXGuPWWWv
	L+BoeZYYCPmbLP3ydSItyMPHep/1mU3RCfakBXyvIiE9O2/g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pb1qvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:59:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad91787a1aso341044a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793951966; x=1794556766; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q99MY6Y15R2IsZRNnTlhKJlm5z/8BXTFZjWhC+CFrEk=;
        b=F2is17M23PYkikUFRVz5Wk7vZcUkJoyBiL3gM5p78AfP4eoBvM1FfRb0t4QDoVX8mh
         WHlQwDgb5KMw4sow1tMEUM304WVC6dyYU5RChuM783ahi7mKl4znbzpy+gFS8svyuUMW
         jEsxbyKRopXw5pXcCUpA9kP3Wei2cGkPcwelsgcwGCWhTl21LXVu+JvORmca6VOv03hk
         /LUUr4ZOAFJahr48ZeLUBYpDy8S8nMGTGpFa4VFcs7W+yJxaeaweVdCJtIzXm72YTkM+
         hgcLP9oOi5SfdbB0FJnczcjNOgiVnSpF4Ak4QwCV9LNlWmlevEKbs3YzaZ6rdz1f1fB2
         cHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793951966; x=1794556766;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q99MY6Y15R2IsZRNnTlhKJlm5z/8BXTFZjWhC+CFrEk=;
        b=Vt4TqvpJaqtItyziHKlp1gqXx1DKFUVOivxYRKCO6l85G3E19LlufMgCKrDiFg9QVH
         FreqaZI6O2HNT8NrKhNxOkBP+lRdm+IcMYb9PBYU3DreymFTdbze76KkD+rVxuaQGG5c
         3gf/Kqgfv2wx8pFOdVWIEBsCcAuIectS2JcfcURS7mfEG4n93RE2d8uL62c5gq332GOt
         Jzp+0sDZ5T++Grgdnl1AQ1OgJFZCK/XQh92oDc/sqOPulXBspmTyUhpTjNhS+tpg1Uy3
         kCIasS8YOGqFolTPt2EAymQGXw2oTv2sB0osSTJXDaJ2361nBrNVB32iijDVTRM/XPq8
         /dyw==
X-Forwarded-Encrypted: i=1; AL+hErEMJ46f8tGRhg5u2mVl/bzd+qIDBhcQgcQzyxSZw0pPf0y1jiDV757bRpiIES/lY+eg3UEA4/cWK0XXsf8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HY519eNiwxfTP8lz86RLjt/WGDW/Ao9OfN1UxD7lG0W8f2Eos
	K6oLpGpVJyvOET9imYM6lxtD9v0s5zCmmhWviuMHip8NOtz9QAntLbPfa127H8ZH8EivbndttNs
	/nJNltpnBDZ8kZ8c93jj8ElvOzxyQbxqoHAuA/Tip3Qb++fFBZynfhr5+INrfmfuU9Q==
X-Gm-Gg: AYBFou0v1CFVKs/RXdhXQUIxFPx5vYjGUgA28ctdFihSzF3e/qhNckpBNuIwoEvsggE
	rQb/48xQBDvaHjIiohfzPtok4j0octO4VsI37tEE/DlsQftLGMKksqYPTDR3yoWSXs6ZN6CAQNH
	6NjuBs/yt38NYv4MTk1VjxxPGXtKNjiHWg1vm9nXTc8RVbUI860vMhiGFCem8Rdee89q2dcDPvs
	WCX2DkRNXuAyUF+Ql9D1f2IKPVubNCkaxl6E1vu3tSlEJ457uF64jDVov1xijVpJuqWVsQwxQSC
	lKa4qgKxhm1ELk63fggnxsXqdqndRgaEiUWz2ubBhCx+m731GCpfIy9FNh8zaYVbJHoNYasAxXT
	eL/LQvKlK+QIQHUnqf4bjIAGqWPrqqL19uWU4hfXgm15fQ9J9FCbRoRdKG/ZnhhdxReHaRlfGy9
	tr8U2NjMJ8sxnb6rIBeT0iy0yT9w6IolzQ9dXjD/n+QxdwZnYKV37YAFZ53dni1vI50bmzlk8=
X-Received: by 2002:a17:90b:580b:b0:3ac:a203:e092 with SMTP id 98e67ed59e1d1-3b0db609a2emr1582925a91.1.1793951965672;
        Thu, 05 Nov 2026 23:59:25 -0800 (PST)
X-Received: by 2002:a17:90b:580b:b0:3ac:a203:e092 with SMTP id 98e67ed59e1d1-3b0db609a2emr1582906a91.1.1793951965021;
        Thu, 05 Nov 2026 23:59:25 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e4b3cf54sm321685a91.2.2026.11.05.23.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:59:24 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Subject: [PATCH wireless-next v4 00/21] wifi: Add Seamless Mobility Domain
 (SMD) AP support
Date: Fri, 06 Nov 2026 13:28:37 +0530
Message-Id: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAK+I7WoC/22NywrCMBBFf0WyNjJJ09q68j/ERR6jDdhEM7VWp
 P9ujODKzcBl7jn3xQiTR2K71YslnDz5GHJQ6xWzvQ5n5N7lzCTIBjpoOQ2Oi6Zrm7YGt5U1y81
 rwpOfi+XAHj7hBYl4wHlkx/w2mpCbpIPtP6pB+/Chek9jTM8yPcnCflekKiuT5MCNUQCdclo4t
 Y9Em9tdX2wchk0+xT5VP1QIaL5olVGxlVVXA1b21P5Bl2V5Ax4+41P+AAAA
X-Change-ID: 20260908-smd-16986850d725
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 328myZ3l-uEQhjtAknte4dTZroG6q6YK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfXwLK8+bnm5IyP
 Yt96rpGVP9S+KGqOrxNHx8JDGgGF9YoN0CruwcLHvOn8cwsLSH1C55Tl42gq1HHl0ERnWBpSI0a
 D//5JH1cumWFMRkvNV3ADxiqVNJ486M=
X-Authority-Analysis: v=2.4 cv=LIrz05W9 c=1 sm=1 tr=0 ts=6aed88de cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=OFvTc2gG9qq4mXXTevoA:9
 a=3jqNGqr5N6mGiUh-:21 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 328myZ3l-uEQhjtAknte4dTZroG6q6YK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfXz/6B/hTDTMDd
 ZpC30EN7YSEEjSiNjaKUbTh6HGx/C9p9tbpY4AhFC1in3v56NUaowFXIQd/faSS1XSKNMjRWyLP
 Jn1gnQQItdI8q95HGlDlLTOw7HI65QkrwgnPZ5RXHWsPvBCzQFKyre4XrIdYJRvRPx5fptqKRec
 /Q++GY9//ttFnLN0VtMWzTQBSThLFS/wQ6aZoohYOCOlDAjt+xewhqCN87ayJ7oj+eJWwnT7wip
 aIG0K+PLKWoRpUVz/iFPg9s2+zmDdrfTOpplQeHe6AZKmJdAFbzt/ZrtrxzJEX0LkYpQIV/vm7z
 7OKdQG9XR0GOZxpzh3XXm8K6V/t1frTOAZZKHCvdjksBSyqAU85IdBXwXGmygzGLKQc8v8eMTvR
 auDjLrxbC2Ltq39v70TydO/s1Yzvgy3YO484+d1yQVjdlVgp5whP8j/fVudMWUqlo/4aInnmgR8
 aNjDfXNoIrAPqM95geQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060031

IEEE P802.11bn introduces the Seamless Mobility Domain (SMD) - a mobility
domain uniquely identified by the SMD identifier MAC address - where
a non-AP MLD that is associated to the SMD Management Entity (SMD-ME) can
transition from its current AP MLD to a non-colocated target AP MLD
without requiring reassociation via SMD BSS Transition (ST) procedure.

This series implements the nl80211, cfg80211, and mac80211 support for
SMD BSS Transition in AP mode. Along with a summary of the ST procedure,
the design of this series and patch structure are presented below.

The ST procedure broadly involves
  - ST Discovery and association to SMD-ME
  - ST Preparation
  - ST Execution and Downlink Draining
  - ST Context

The communication between the current AP MLD and target AP MLD are via
Inter-AP (IAP) communication (solicited and unsolicited) over the backhaul
which is managed entirely within userspace (hostapd) - as per the
discussions on the RFC [1].

The IEEE standard defines only the type of data that may be exchanged via IAP
but does not define the format and method of the IAP communication protocol
and keeps it out of scope (subclause 37.16.9). So, those details are not
part of this series.

ST Discovery and association to SMD-ME (subclauses 37.16.2 through 37.16.4)
===========================================================================
A non-AP MLD may use techniques like active scanning, neighbor reports,
or BSS Transition Management to discover the neighboring SMD AP MLDs.
Once discoverred, the non-AP MLD can perform authentication and
association with the SMD-ME and negotiate SMD capabilities. While
generating PTK, based on SMD PTK mode, either SMD Identifier is involved
in the PTK formula or only SMD KDK is generated.

 - This series supports configuring an AP MLD as managed by an SMD-ME
   with attributes such as SMD Identifier, SMD Preparation Timeout, SMD
   Type, PTK Mode, etc., via NL80211_CMD_START_AP.
 - This series supports managing the associated non-AP MLD that has
   negotiated SMD via NL80211_CMD_NEW_STATION and
   NL80211_CMD_CHANGE_STATION.

ST Preparation (subclauses 37.16.5 and 37.16.6)
===============================================
The current AP MLD and non-AP MLD can use BTM frames to select a target
AP MLD that the non-AP MLD can transition to. Once the target is
selected, the ST procedure is invoked in two phases: ST Preparation and
ST Execution.

The non-AP MLD sends an ST Preparation Request (UHR Link Reconfiguration
Request frame to with Type set to ST Preparation and Per-STA Profile
subelements of the setup links for the target AP MLD carried in a
Reconfiguration Multi-Link element) to the current AP MLD.

On reception of this frame, the current AP MLD collects the non-AP MLD's
dynamic sesion context and attach it to the same frame while delivering it
to userspace. Userspace then sends this information as an IAP message to
the target AP MLD. If Per-AP MLD PTK mode is used, DH key exchange
happens in ST Preparation to derive the new PTK at the target AP MLD.

The target, once processed the message, will set up the links as rquested
and sends back the ST Preparation Response so that the current AP MLD can
send the ST Preparation Response (UHR Link Reconfiguration Response frame
with Type set to ST Preparation and statuses for each setup link) to the
non-AP MLD.

 - This series defines the layout for STA's dynamic context and supports
   reporting the driver-attached STA's dynamic context along with the frame
   via NL80211_CMD_FRAME event (this avoids roundtrips between driver and
   userspace to separately request context for the recently received frame).
 - The target AP MLD leverages the existing flows to set up the links
   (NONE -> AUTH -> ASSOC).
 - This series supports moving the STA to the prepared state (4a) via
   the new STA flags (subclause 11.3.1).
 - This series supports programming the STA's dynamic context via
   NL80211_CMD_SET_CTX on the target AP MLD.

NOTE:
(a) While implementing the suggestion to follow the approach similar
to how radiotap headers are attached to the SKB, for tagging the STA's
dynamic context to the frame SKB from driver to mac80211, an alternative
approach was found.
(b) This reserves a new field in &struct ieee80211_rx_status as part of
an existing union (please see this patch [2]). Since this was simpler
than _pushing_ the context pointer to the frame SKB and _pulling_ back,
this series follows this approach.

ST Execution and Downlink Draining (subclauses 37.16.7, 37.16.8, and 37.16.10)
==============================================================================
When the non-AP STA is ready to transition to the target AP MLD that it
has already been prepared with, it can send the ST Execution Request
(UHR Link Reconfiguration Request frame with Type set to ST Execution)
in two ways:

Via the current AP MLD
----------------------
This path traces a similar flow to ST Preparation for context collection
and reporting to userspace of the current AP MLD, transport to the
target AP MLD, and ST Execution Response back to the current AP MLD and
non-AP MLD. If there is a Nominal Maximum DL Draining Period Duration
field is present in the ST Execution Response, the current AP MLD may
start the DL draining period to drain the pendign buffered frames to the
non-AP MLD.

 - This series supports moving the non-AP MLD to the execution
   in-progress state (state 4b) via the new STA flags on the current
   AP MLD
   upon reception of the ST Execution Rquest.
 - This series supports moving the non-AP MLD to the DL draining started
   state (state 4c) via the new STA flags on the current AP MLD and
   implements proper validation for these flags as they are mutually
   exclusive.

Upon successful ST Execution, the non-AP MLD moves to the authorized state
(state 4) on the target AP MLD and the unauthenticated and unassociated
state (state 1) on the current AP MLD, without reassociation.

Via the target AP MLD
---------------------
The non-AP MLD might send the ST Execution Request directly to the
target AP MLD when the current AP MLD links are not reliable (RSSI drops
after ST Preparation, etc.,).

When the target AP MLD receives such a frame, it cannot collect the STA's
dynamic context. Hence, the context is requested from the current AP MLD
via IAP and then programmed on the target AP MLD. There is no DL draining
in this path.

 - This series supports fetching of context on the current AP MLD on
   behalf of the target AP MLD via NL80211_CMD_GET_SMD_CTX and
   NL80211_CMD_SMD_CTX_EVENT.

ST Context (subclause 37.16.9)
==============================
The following information are part of the STA's dynamic context and transferred
from the current AP MLD to the target AP MLD during ST Preparation and
ST Execution:
 - Block-ack parameters and timeout per TID
 - Next DL sequence numbers per TID
 - Duplicate receiver cache entries
 - Replay counters
 - Starting PN for DL individually addressed frames
 - SCS stream descriptors
 - MSCS Descriptor
 - EPCS authorization info and priority access state
 - WinStartO for existing DL block-ack agreements

The non-AP STA may optionally request that sequence numbers not be transferred
(to reset SN at the target AP MLD).

This series suporting the SMD BSS Transition is structured as:
 - nl80211/cfg80211 set of patches followed by their corresponding
   mac80211 set of patches.
 - nl80211/cfg80211: patches 1 to 11
 - mac80211: patches 12 to 21

[1] RFC: https://lore.kernel.org/linux-wireless/fbf4209c-4fd8-4047-96d7-7fa34d9ba44d@quicinc.com/
[2] Patch ("wifi: mac80211: handle UHR Link Reconfiguration frame")

Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
Changes in v4:
- Fixed clang warning in ieee80211_tx_h_smd_state
- Link to v3: https://lore.kernel.org/r/20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com

Changes in v3:
- Replaced deprecated dev_{hold,put} APIs with netdev_{hold,put} APIs.
- Split and sorted the patches to list all nl80211/cfg80211 set of
  patches followed by mac80211 set of patches.
- Relocated context layout and cleaned up driver context with standard
  fields defined - ("wifi: cfg80211: define layouts for SMD BSS Transition
  context").
- Split ("wifi: mac80211: handle UHR Link Reconfiguration frame") to
  pass @rx directly from ieee80211_rx_list() in ("wifi: mac80211: pass
  rx_data directly from ieee80211_rx_list()").
- Added nl80211 DOC for AP SMD operations in corresponding patches.
- Added SMD state based frame filtering in ("wifi: mac80211: filter
  uplink and downlink frames based on SMD states").
- Added DL Drain early termination event support in ("wifi: mac80211:
  define API to invoke SMD Drain Completion event").
- Fixed up commit texts and kdocs because of patch reorder.
- Rebased on top of the latest snapshot.
- Link to v2: https://lore.kernel.org/r/20260924-smd-v2-0-bb40094da1d4@oss.qualcomm.com

Changes in v2:
 - Replaced SKB extension with a mac80211-contained solution using
   ieee80211_rx_status to forward the ST Preparation and Execution
   frames along with the context.
 - Fixed cover letter, commit text, and kdocs to clean up the
   AI-suggested style and words.
 - Fixed the build failure from v1.
 - Rebased onto a latest snapshot of wireless-next
   (6c0b7357e3c7f365ec51dd8d2b626130ee983ce1).

v1: https://lore.kernel.org/all/20260908-smd-v1-0-65ad4ab30fbd@oss.qualcomm.com/

---
Aditya Sathish (1):
      wifi: nl80211/cfg80211: define interfaces for SMD setup and STA update

Pooventhiran G (19):
      wifi: nl80211: define Seamless Mobility Domain (SMD) device capability
      wifi: nl80211: add SMD BSS Transition sub-state STA flags
      wifi: cfg80211: define layouts for SMD BSS Transition context
      wifi: nl80211: define interfaces for SMD BSS Transition context transfer
      wifi: ieee80211: define APIs for UHR Link Reconfiguration frame checks
      wifi: ieee80211: define API to check if frame is class 3
      wifi: nl80211/cfg80211: pack SMD dynamic context along with frame
      wifi: nl80211/cfg80211: add support for SMD context programming
      wifi: nl80211/cfg80211: add support for querying SMD context for target AP MLD
      wifi: nl80211/cfg80211: define API to notify SMD Drain completion
      wifi: mac80211: apply SMD BSS Transition STA sub-states
      wifi: mac80211: add driver_op for SMD substate changes
      wifi: mac80211: filter uplink and downlink frames based on SMD states
      wifi: mac80211: send BlockAck policy in AMPDU action
      wifi: mac80211: pass rx_data directly from ieee80211_rx_list()
      wifi: mac80211: handle UHR Link Reconfiguration frame
      wifi: mac80211: add mac80211 support to handle NL80211_CMD_SET_SMD_CTX
      wifi: mac80211: add mac80211 support to handle NL80211_CMD_GET_SMD_CTX
      wifi: mac80211: define API to invoke SMD Drain Completion event

Rohan Dutta (1):
      wifi: mac80211: set SMD parameters for AP setup and STA update

 include/linux/ieee80211-uhr.h | 125 ++++++
 include/linux/ieee80211.h     |  43 ++
 include/net/cfg80211.h        | 186 +++++++++
 include/net/mac80211.h        |  96 ++++-
 include/uapi/linux/nl80211.h  | 254 ++++++++++++
 net/mac80211/agg-rx.c         |   1 +
 net/mac80211/cfg.c            | 189 +++++++++
 net/mac80211/debugfs_sta.c    |   4 +
 net/mac80211/driver-ops.c     |  24 ++
 net/mac80211/driver-ops.h     |  54 +++
 net/mac80211/drop.h           |   1 +
 net/mac80211/ieee80211_i.h    |   2 +
 net/mac80211/rx.c             | 140 +++++--
 net/mac80211/sta_info.c       | 146 +++++++
 net/mac80211/sta_info.h       |  19 +
 net/mac80211/trace.h          | 104 ++++-
 net/mac80211/tx.c             |  42 ++
 net/wireless/core.c           |  25 ++
 net/wireless/mlme.c           |  41 ++
 net/wireless/nl80211.c        | 930 +++++++++++++++++++++++++++++++++++++++++-
 net/wireless/nl80211.h        |  12 +
 net/wireless/rdev-ops.h       |  28 ++
 net/wireless/trace.h          |  61 +++
 23 files changed, 2485 insertions(+), 42 deletions(-)
---
base-commit: b8e5b0ae8ff47240366d38e5d12c65f878724316
change-id: 20260908-smd-16986850d725

Best regards,
-- 

