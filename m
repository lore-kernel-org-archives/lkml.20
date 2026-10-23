Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775869;
	b=V8y9TEiOwVOGG7h/8JzIdJfUBwdUOSwwRtT3g4FdMvVkF9N9ywG6Rxi1Mn4La403ZWkO
	 mbhSgyN6Ehd+AoNvKLb+F1okj+K4jcaWuGRq1GckyeRhMkTB7fRTKz+TBqfJd8F85Rk0a
	 6xfF4pGD9pdWyk2kistST8lE8Apm/SsyvZvh9Tl4u/IgOj3deFkbFBM/9YyobGMnu671X
	 f6Oujyds/T6kEtYlZGavS+kdhLfdU6PDHw4CWSln+I9HFEbPXqlR+EfEmQ40ESZE6f4tg
	 iGQh4ykzq/mFGkjib9er5i8vr8wG51vJNF9RuW339biz89n+eLkDKj7sEXCy7DXgXLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775869;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bY5AIFa9gIOGPAM6kQqMS0dSkQ+H027w/kwbGPSI7Ws=;
	b=EID3emLnsG6kzIcmguZOvwK7Mc+U+gE5YM7e5o1y8W2iyNgkaj8kUSb6cTzowK94OSM7
	 cQNQQIhYrhzohtgwq62WUAX2aSVF1TGja76SLVg2VL54AgpKtAm1MR/E/5JBriJdfu9H0
	 /XV1nERRKUUpHA6SL9DZya50buSgMYJTmtdsoK/7dm+nR2YO06JK62tse3dMYhs31mykx
	 nXX9T5YhRUwYxCBcMUugmtEHDw87gF6NRD4mi3wS2B5rQ56C5yYnuoIs6Hkooc83hYHBJ
	 cQ4wOYsrWZa51zbQn/0VBKkDhqjub1jQNZ9ep10nM5wDjppWRzVbejEcD0JJUESTeIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lvJAH84b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j653Zk7v;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E027606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E027606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lvJAH84b;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j653Zk7v
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6uqM1492398
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bY5AIFa9gIOGPAM6kQqMS0dSkQ+H027w/kw
	bGPSI7Ws=; b=lvJAH84bzvk6TH1WAdoptcY5tPVhNqy6J98PbTXljNp9sURkNYo
	S8dP/m92eY7q7R1+Elldwx08oKA6Ta6CJH+4CQBhm79t22llnVayJnZpAW368tYe
	7bZQsUusNWdKjC7QpwP0K0Idtzs8OsMD6UuFkRJkw4NQJCbC2uDf+SP746NQ/k2J
	op9ulbAASZH+06o8tqNcIap5afQ3ZXvxmn7mwcctx2yO4tbx4y6ICUOfpVb1Nnrw
	zU0QWq6lDctc2fvUyAgSSRqbs3Ap/T/f1nmKS2BWTI1rH71X1fiT8WbepIIKaxlA
	TYYcM8oWlGQ1U+kuKsFrqTx5MFz3TJQWCaw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmav6s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:17:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so255359885a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775868; x=1793380668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bY5AIFa9gIOGPAM6kQqMS0dSkQ+H027w/kwbGPSI7Ws=;
        b=j653Zk7vvTXsMAmJHrQNiSlIcU2WffnPD0qfW/5iS4+c6Sgdpes/Hl5CmcO6tyJNDF
         snK2phLvRXKLCrkOrgHGz8icnf+v9NoCgb8pCRZlQ2eZDMKncco4O6Zs9x+Ox/ZKZpSy
         DTQNr7RojNb7KuPs+Lfw/VKsAwGuJ8YKP4Rro398tuUKtaNQTX4ecwlhr0bX66sfN0GB
         9L6rrWR3fbFfut+XDQl2YTumbl/7InD6GWaL0XXDv5dqcuY/eug8852qv4aAG2YF/2o7
         AqLJjbbEUtBW7E6GUQTBJORfUfy0mx09d6XlF+Bvq/dti0XAXg/ySBjYu6w3Z/fg82YS
         DpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775868; x=1793380668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bY5AIFa9gIOGPAM6kQqMS0dSkQ+H027w/kwbGPSI7Ws=;
        b=BsdrZgCq/BC6DR8n1viuYTUyTDOwdDFjQzaJJU+l4t7roKp25ecUwFYDE7buKVxweD
         AaK2H4wQ7MdzHa3zHuXzrC3+yL//CgS+cbM2dvmnLNJviFQVAbDllZRAudrJXeBjjSNw
         +5KO2IQm2U4Gf0oMLwa7mjGT2ywFMPK5Lo3e4JNThMj4rhq1iDxZvszl0VP+T32Wq4HR
         V3R1kcVtSv7s7lQQ2Z6lgqGUqVBcfkweBFJEY6wLDpiXUDTdtKdF7BLmylqxLGTfb7Ru
         48ZO7jNZuU+XRcnS8SbiPZkf5xh+osei26d0yvr+EoGhmegJ3D1Hb/pW0POAW1X2y+Ey
         o1vA==
X-Forwarded-Encrypted: i=1; AKwUvBw4hBDWe9bTCf0rttheX+Ht6/2rbFLWVa+2LyqAz3+KaFo1rwPCSEH0QSXx3MN4NmWLetOa9Be8HjnPThY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+jyjKhTN3axOp2o4fxAEac4A4yz8EnJ0Unc3EGqIhAVXO/DuR
	WZN1CP4j+FFepLt8d5q3r9mQSW0vNIpQqi8/X+vUzX+hNVyo/ifNRxAYD2feGGmM95Iz2fhUZNZ
	z9KP9kYTpcV/JsPMVEqlQ6iljgZSBU8p5h1nECkY/hMolGFPGXTcH8ZMXbg08wXIqr3U=
X-Gm-Gg: AYBFou0Gfdj8pkjsuPS+sQj7OE5Q8I9nnehwZpgaml92LyVZ4g1kQvo/OiOt2408Z+A
	RFfjs1kyx5EqamMBQcf43sUTtwYG/2hF9cEpcM/jLkZ38Zq7KlT6qfXSW9fmegqZ99QxXIPqbkj
	LvG30MVpfQU2mHmED4UMCt+HGA188BjpLSvfZs9Sy57WW1m7wjhTvdHX5XRQCoeO8wQAgHpDI6t
	F9daT5BcuI9AL0Xw7Na/sO3Ifsaq8gkj1cnuYvVL/LO0oPWMAvbF2k5VTCj9zfrAS0stxT8XXtP
	rya9XFNeH0BBQfkLsBpYhtezQd2YjBizBkgPW85hTa0jLwtPz+ePZ32ErmJCfynCJlu9e++0bUi
	8+Lyns4Zt6mG0
X-Received: by 2002:a05:620a:44c2:b0:93e:618e:a2d0 with SMTP id af79cd13be357-93f6f7e01e2mr537194485a.60.1792775867513;
        Fri, 23 Oct 2026 10:17:47 -0700 (PDT)
X-Received: by 2002:a05:620a:44c2:b0:93e:618e:a2d0 with SMTP id af79cd13be357-93f6f7e01e2mr537189485a.60.1792775866871;
        Fri, 23 Oct 2026 10:17:46 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:17:46 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 00/23] ASoC: qcom: AudioReach Active speaker protection for WSA884x
Date: Fri, 23 Oct 2026 18:14:10 +0100
Message-ID: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
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
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb96bc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=NEAV23lmAAAA:8
 a=SpZKVrqkZbRJdBaj5PEA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXyd+LHn9WbFHD
 moLrYGA1Ogqz402M2VtG2hkH9/PcYPbSSEtZ/lMkHEYSrQBjmg4YDvvib8wsMIliae4QvyZJWkk
 lJeTbMNyOiHlWYFXRv1TjsyWFH6gbwI=
X-Proofpoint-GUID: ckomRYpUHoJS83ydNhuCEwiyDKQRcNGk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX16FuUu9tafD4
 p9xR+E7w1j3C2w5QUIPqZC7mxMDmerWWIyGVHMFEApSD1jQJCagd1MP97xJ/sTX3SgLmOti2KVC
 SI3J2ph6Q3ybR3K6Z4v8WbAJGavQd4UyQ/idQdS/z5n55JjfiJwG6I6uArzZg5a6APq2i7ltSX5
 Rebe4GnJTapJqVOz0GGbRnSQmsznlbzf//Q6sQ/SrpNZrrA0QthMLYZB53vD5mHp+fgu68Cd/vO
 Nwfws1OpDu/2BNKrOV8BrwdYs5UUVUxaLDOMKUTjkRLV16a2Xq3PkfoHoePWcnRMtmiAIhU1VrC
 hX7Lg6Vg8qL8jiMIntmtDWscEMcS19a8dugiJFqsYYZ8A8w6nH17C1SARek0A9CPjAoaXjpWoGf
 xDsOnayrYv4MYjnUH3Qj3nDsGHZcXJIAc+Wtah7lDqP8RGDx8Wd8+LkpH0f0QDnpXvYX6y2x3aK
 Z+gYdmo9st/WlYB/cVw==
X-Proofpoint-ORIG-GUID: ckomRYpUHoJS83ydNhuCEwiyDKQRcNGk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

This series adds DSP Active speaker protection (SP) for WSA884x speakers on
Qualcomm AudioReach platforms. It was tested on the Lenovo ThinkPad T14s
Gen 7 (2x WSA8845) and the Glymur CRD (4x WSA8845).

Speaker protection needs the amplifiers' V/I sense capture running
whenever the speakers play. Rather than a separate capture link that
userspace has to keep open, the VI codec DAIs sit on the WSA Playback BE
link, using a new multi_direction codec-codec link flag that makes the core
run .hw_params/.hw_free and stream events for codec DAIs of the other
direction. This core change is the main reason for sending it as RFC,
and feedback on the approach is very welcome.

 - ASoC core: default ch_maps for links with more than 8 DAIs, and the
   multi_direction_codecs link flag (documented).
 - qcom sdw: per-direction stream runtimes on such links.
 - wsa884x: VI sense capture DAI, die temperature as a thermal zone.
 - AudioReach: control links, VI calibration mode with per-speaker
   events, R0/T0 cache and restore in normal mode, static cfg blobs,
   and mixer controls for mode, R0/T0, live T0 and calibration state.
 - x1e80100: VI feedback on the WSA Playback link, speaker thermal zones.
 - DT: VI feedback for glymur-crd and the T14s Gen 7.

A topology with the SP and SP_VI modules is needed to use it.

How it works:
1. The topology puts the speaker protection (SP) module in the playback
   graph and the SP_VI module in a VI feedback graph fed by the WSA VI
   sense ports, joined by a control link.
2. Starting playback on the WSA Playback link also starts the VI sense
   capture (8 kHz, 32-bit, one V/I pair per speaker), so the DSP always
   gets feedback while the speakers play.
3. Calibration, once per device with the speakers cold: userspace sets
   "Speaker Protection Operation Mode" to Calibration and plays silence;
   the DSP makes its own stimulus. The VI module measures each speaker's
   resistance (R0), the driver records the amplifier die temperature
   (T0) with it, and "Speaker Protection Calibration State" reports the
   result.
4. Userspace reads R0/T0 from "Speaker Protection R0T0", switches back
   to Normal mode and saves them, e.g. with alsactl store.
5. At boot the saved values are written back (alsactl restore). In
   Normal mode the driver sends R0/T0 to the VI module, and the SP
   module uses the live V/I feedback to keep each speaker within its
   temperature and excursion limits.

How to test (card 0, two speakers; for four, use aplay -c 4):
1. Boot with this series and a topology that has the SP and SP_VI
   modules, and select the speakers as the output so the WSA path and
   the "VISENSE Switch" controls are on. Stop all playback.
2. Play one second of silence so the amplifiers have been on once and
   "Speaker Protection T0" reads a valid temperature, then wait for
   DAPM to power them down (about 5 seconds):
     aplay -D plughw:0,0 -f S32_LE -c 2 -r 8000 -t raw -d 1 /dev/zero
     amixer -c 0 cget name='Speaker Protection T0'
3. With the speakers cold, in a quiet room, start a calibration and
   keep the graph running with silence; the DSP makes its own stimulus:
     amixer -c 0 cset name='Speaker Protection Operation Mode' Calibration
     aplay -D plughw:0,0 -f S32_LE -c 2 -r 8000 -t raw -d 15 /dev/zero &
4. Poll the state until every speaker reports 4 (success); 5 (failed)
   or 7 (timed out waiting for V/I) means retry:
     amixer -c 0 cget name='Speaker Protection Calibration State'
5. Stop playback, go back to Normal mode, then read and save the
   result. R0T0 holds R0 in Q24 ohms and T0 in Q6 degC per speaker:
     amixer -c 0 cset name='Speaker Protection Operation Mode' Normal
     amixer -c 0 cget name='Speaker Protection R0T0'
     alsactl store 0
6. Reboot. alsa-restore writes R0/T0 back and every playback runs with
   protection in Normal mode. The kernel log shows the values, e.g.
     SP ch0: R0 3.102 ohms, T0 45.000 degC
I have script to do these, I can share it if anyone wants to try it.

Tool use: an LLM coding assistant (Claude Code with Claude Opus) was
used for some of the patches in this series, to debug the bring-up and
to draft the code and commit messages.

Why RFC:
- get some consensus on codec-to-codec which are in different directions
- To avoid duplicate efforts.
- Still 1 or 2 patches cooking to force dsp to program default safe value
- test it on X1E platforms.

Based on next-20261022 with the "ASoC: qcom: AudioReach and WSA88xx
fixes" series applied.

here is my wip kernel tree along with tplg and ucm:

https://github.com/Srinivas-Kandagatla/linux/tree/glymur
https://github.com/Srinivas-Kandagatla/audioreach-topology/tree/glymur
https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/glymur

Ravi Hothi (11):
  ASoC: dt-bindings: qcom,wsa8840: allow one sound DAI cell
  ASoC: codecs: wsa884x: add VI sense capture DAI
  ASoC: qcom: audioreach: run VI module in calibration mode with
    per-speaker events
  ASoC: qcom: q6apm-dai: add S32_LE format support
  ASoC: qcom: audioreach: support up to four speakers in VI feedback
  ASoC: qcom: audioreach: cache VI calibration results per speaker
  ASoC: qcom: audioreach: make the speaker protection operation mode
    configurable
  ASoC: qcom: audioreach: send cached R0/T0 to the VI module in normal
    mode
  ASoC: qcom: audioreach: send static cfg blobs to speaker protection
    modules
  ASoC: qcom: audioreach: add speaker protection mixer controls
  arm64: dts: qcom: glymur-crd: add WSA speaker protection VI feedback

:wSrinivas Kandagatla (12):
  ASoC: soc-core: allow default ch_maps on links with more than 8 DAIs
  ASoC: soc-pcm: add multi_direction_codecs link flag
  ASoC: qcom: sdw: add per-direction stream runtimes for multi_direction
    links
  ASoC: codecs: wsa884x: register the die temperature as a thermal zone
  ASoC: qcom: audioreach: add control link support to graphs
  ASoC: qcom: audioreach: pin SPEAKER_PROTECTION_VI media format
  ASoC: qcom: audioreach: add live speaker temperature (T0) readback
  ASoC: qcom: audioreach: add speaker protection calibration state
    control
  ASoC: qcom: audioreach: keep the last VI calibration result until the
    DSP reports
  ASoC: qcom: x1e80100: carry WSA VI feedback on the WSA Playback BE
    link
  ASoC: qcom: x1e80100: register WSA speaker thermal zones for speaker
    protection
  arm64: dts: qcom: mahua-t14s: add WSA speaker protection VI feedback

 .../bindings/sound/qcom,wsa8840.yaml          |   5 +-
 Documentation/sound/soc/index.rst             |   1 +
 .../sound/soc/multi-direction-codecs.rst      | 135 +++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi      |  29 +-
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   |  19 +-
 include/sound/soc.h                           |   7 +
 include/uapi/sound/snd_ar_tokens.h            |  13 +
 sound/soc/codecs/wsa884x.c                    | 160 +++-
 sound/soc/qcom/qdsp6/audioreach.c             | 779 +++++++++++++++++-
 sound/soc/qcom/qdsp6/audioreach.h             | 105 +++
 sound/soc/qcom/qdsp6/q6apm-dai.c              |  16 +-
 sound/soc/qcom/qdsp6/q6apm.c                  |  42 +-
 sound/soc/qcom/qdsp6/q6apm.h                  |   1 +
 sound/soc/qcom/qdsp6/topology.c               | 273 ++++++
 sound/soc/qcom/sdw.c                          | 236 ++++--
 sound/soc/qcom/x1e80100.c                     |  81 ++
 sound/soc/soc-core.c                          |  46 +-
 sound/soc/soc-pcm.c                           | 122 ++-
 18 files changed, 1924 insertions(+), 146 deletions(-)
 create mode 100644 Documentation/sound/soc/multi-direction-codecs.rst


base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
