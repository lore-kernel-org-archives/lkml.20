Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCC7374721
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 21:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791236293; cv=none; b=DgHVZjT8g34VRktv5WQFba9tys0ZkQtAdl0aGbzBUTYIwiVUb0WRJX0URvxU9hY1Jj6ifWMiwj4cQ1wjy9sS2PGY9+xvu6wcfHd8PhT3h/K035/rpVOUfDPNuggNKT7FdQHQnBDOPf5MJGA3bAGTUFWYoTFQj6x5v58fwfSdCtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791236293; c=relaxed/simple;
	bh=GbkLAgUUmDwSS1vg+XH6mSzqBdhVNeWKPGXj86+FiB4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=svufES7IJfXcMXPqSYwXk9ykMMXxAnAm3wOKJvK54gyq74Bb2RjFjYdINmzMJUnqL7Uwm6pkmR/r6aUP79pPjFZ6mXa7fnll6EzyfublDuJvbzHxHxRYkiv6hEok/5T7peuNh2rEbuc83GRva1qsM04hRYGgxBuo4TGyTlQuwy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mXZXRAyp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SeUJnJa+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mXZXRAyp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SeUJnJa+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KMjiF1535299
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 21:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XtJhnIzcE7QOY0iThbQFPE
	LcxRJJ39HnVVt8JMIZXf0=; b=mXZXRAypPAO+VoOY1gidXYGU8jS7fnxJyN9Etc
	gLlnPcli+mFZxCaMT8i+xlhEbOhTFoxhsoahcvbguv84fh2xhg61hFM5Gk1yJzkp
	l94TP34FsCW4YxFs8PEd5YZ64lzmGZZnjnNy1uKYmbT09i2VsCqnhTx4rZ3oFJHa
	PejOoEOL6/so2Y5URl0N8IFF/kEoogDT70kWdNtRWmsLEbnXIfwaRPtTrPJTK2lF
	YquLTNPk4KoMnfo84yZySwKEq5L13c8xp+Edl9nIbMGxRj6As0yV9UMyafSTKVpG
	Em7MzW0OKkw9WRXwr+v/qSO6q+DByo1dKkICWrotylxK+taw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4dnchm41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 21:38:11 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-313b1501a0aso315413eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 14:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791236291; x=1791841091; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XtJhnIzcE7QOY0iThbQFPELcxRJJ39HnVVt8JMIZXf0=;
        b=SeUJnJa+sILgU3OTxoO3PEQATy7vyrN6NjoZ6GfUvGPj0uevqvan0V+IwZPy2Zzzfa
         v9yLePdOlYQt0I9BZ3RGs9M/HwL8G5faAVcBaOZ0yh1MQxuNTf74d0JT2zY+NMO1id+g
         u328Ln1TLzxUEJqGzsNOhuk/qyX6BNGxMVKqjuo4ykI6axhnyvt2meSG8JyMOKcBOwTA
         ZjLiKQLVb34mE3E168V1yvSZS3mnOWg0SQD1+k5xJ62NuRTAdcsmwTPx3qSZ2tqnXLzH
         2iuF4Cby7320noRlneeS1wRkB9Argq8pf5DCYZiY9fWjUfT4rrkCOfZy5v4DtpqhVqRh
         RUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791236291; x=1791841091;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XtJhnIzcE7QOY0iThbQFPELcxRJJ39HnVVt8JMIZXf0=;
        b=KZjYmgFJFjLvINMxaUC/JqTKD7w6oEkHHaa9nu5fJ826/h4cJS4KwckWs+eLbrHvv+
         sd06H0y5m1NU3vZ0PycwEfiznkBCJDQQsi+JM4amOhq3Xzr/lsxbLdnFBaFQUqsCPlNL
         UMhAwn9zlpszGQrlWSpqvQHWieE46OInQ2RPVfOS9d7B4YrHMVmf2mLSd4lmz3T/qH/b
         oogPsGEgdeTqXqiu4YpdoRiYwUGLulMgg9hzs/kr7wL9PsAHkeP0uJcxzYRmausbQ+O0
         AjL4kmhLGHxEDvwmtXteAj0ovGEjK+C+l88E8z4OMAXfWUSTb3hPPgheCAbl1IoQTEZA
         BL/g==
X-Forwarded-Encrypted: i=1; AKwUvBxBDtOdC8ruX9V24gnYTDNmaFXRYqudEB2zNVc7KyUbcozl6wVacucRz7tu7lbTjjVV76dBCrl8EmJQZMk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIq1Lh/qADGFNgkBS0mpCXgjEIG750rl1aLcCyHwtJWM3efzhOc
	xShG79X/J98MMeoKBXwYxTRHD52b1vyv/wwqwzJE0Q+EUTXD2zsuA67h2uw/zMzjUZaHNl8tlfY
	F2gFCiOnWll9GH6kmuPi8r8avtIkzeID9Fy5ru2Q5SMwEyPcT95H2J3Pc9tGsgNbIjxWkFX/48b
	E=
X-Gm-Gg: AYBFou0icdXA/FUMv6x1pANFdwMv9vCuEYBS3+tSdxvASO0trOPnjDr2ueynWXpL9L/
	H3dWxhGFgu9kSOMxQihgRHdpghku6yUwLdFbgk4b4sjUBvaPzgLNKYlEY/NeTLz2qiid9Zu8sgo
	aoZT//yRmnKL+n+yJYNVAQh6x6skY6IG4+bJShldj2IMVJ7uZDrqE9DzNfdNSPYrAKy/DZJd/WA
	wixW/+ngRHFS+lu0FK650pSdAIcIySQ9xJnGNIMKZW/cvnP1Cfn42g8HHfsNfStSOj2Snkzmr+F
	Di8mMO4sqfoahvztDfn14TqAlsIifFWWptpkntUnqFk5ohJ+GcurjIg7dFaBdb0Zbu4ElW/glDz
	4mLwVkqke3Aut1b9wh7sWIQtMPKbsIQbV5tYnaZIOenUQ+81t5q2U6QKg/uV0
X-Received: by 2002:a05:7301:18ac:b0:34b:7c9c:9a69 with SMTP id 5a478bee46e88-34f06678c69mr21552002eec.0.1791236290450;
        Mon, 05 Oct 2026 14:38:10 -0700 (PDT)
X-Received: by 2002:a05:7301:18ac:b0:34b:7c9c:9a69 with SMTP id 5a478bee46e88-34f06678c69mr21551948eec.0.1791236289808;
        Mon, 05 Oct 2026 14:38:09 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a2c991sm1064954eec.14.2026.10.05.14.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 14:38:09 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH v9 0/5] Implement Region of Interest(ROI) support
Date: Mon, 05 Oct 2026 14:38:05 -0700
Message-Id: <20261005-enc_roi_enable-v9-0-831c24135cb1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL0YxGoC/3XRS2rDMBAG4KsEresgaWQ9suo9SgnyaNQIEru1W
 tMSfPfK2djgaCP4BfMxjzvLNCbK7HS4s5GmlNPQl+BeDgwvvv+gJoWSmeRScy10Qz2exyGdqff
 dlRoVwLaojAVPrBR9jhTT7wN8ey/5kvL3MP49/Eksv1VqEg1vIkVERUZHgNch5+PXj7/icLsdy
 8MWcZKrYoTaKbIoGrSF6EKHFCsKrIrlewWKQhw6LaWXQdmKojaKEDtFFUWgIy8Vb7uuprRbpd0
 pbVECBadU5BFNbSK9Ku6JoosiXQgKbYcYa4rZKHK/F7NsN3qjBPgoASuK3SjAd4pdekHHbQROT
 j+79DzP/0Un/PidAgAA
X-Change-ID: 20260616-enc_roi_enable-4d385c4783ae
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791236289; l=6901;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=GbkLAgUUmDwSS1vg+XH6mSzqBdhVNeWKPGXj86+FiB4=;
 b=5/s8JEp5sAsEVM5GB8kFuTYgjYh+tfwB2Lyu7fhV9gYTFYDVWHg3L78EHNHnj9N3ylb6w3DMq
 bOB1FIhK1+iBHY70RqyoS/FMmMfun2wBUSiE77ywX80jMXcfWdS35lv
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA4NSBTYWx0ZWRfX3zo1K9aOT4nx
 HPdNuKK5VVynjaPLruS4ja6XXBCldqiN7hLlOJvnmP7Fmf2hdqfWVVr4WgNArYp3oTeaCIZl22y
 jNOzHEmscGIOF5NU0LYGD3/J7DJymvs=
X-Authority-Analysis: v=2.4 cv=Vdxir1p9 c=1 sm=1 tr=0 ts=6ac418c3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=DKkvS2Dz--9TOQqJK7AA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: KDBY1JYadz95J-irCeN1wLWYOa-dZ9Jg
X-Proofpoint-ORIG-GUID: KDBY1JYadz95J-irCeN1wLWYOa-dZ9Jg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA4NSBTYWx0ZWRfX+gvbmXP3ibAq
 TLhl39BoxchXj+NUxyB70We9L8wJnIMMWG9rUV2hz1Po/MBAT0zhYxIBRlXSJUY+Ajs2HJmb1DX
 PIC88ZgngX5SEQJNzIqv4lrHeVpt1S8Wpr1dueVBYjZ5U2Zm+fbB2cV4gcDXpxsrWA6NMH9ZoIa
 YEG0/IrRHcQa2H9w+qXKT1lDwxd8PfRRccZ4mSHxbErn4VZ5MOwUwwwk4YGy+tQ5lKjSp4+py9h
 bIBqvmS7LHsnSZMpV6CPSlAf1Xv4HrIZxANOiKT6tKR4SvnGQLcCfeJv5b1zKTlBD0dnfyTcMmF
 7bwLkEUeeWcPkIOABFpCifCxvK1JD+nDu3kQQl906BSCTnyWyy9V5KQY57tk83mqNYwCEmTxgx5
 5Yk12Ix5rvyz98Wb+T0mSiriZygpjzJ1xagRSlBHBdQ2QqG/Ac8LweQYIyRP8oh1/gQWxd1h31s
 M+wp2gm9/YRdFGTuwjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050085

Hi all,

This patch set implements region of interest(ROI) support for
video encoder to be configured as a MB based delta_qp for
the whole frame. Custom controls V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP
and V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE are implemented to achieve this. 
Corresponding support is added in iris encoder to implement this
feature.

This submission and design is based on the feedback received
from community for the RFC[1] series posted earlier. 
Initial testing is done by adding support to v4l2-ctl[2] to test this
control setting and its functionality.

[1]https://lore.kernel.org/linux-media/20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com
[2]https://lore.kernel.org/linux-media/20260616-enc_roi_enable-v1-1-252792d27894@oss.qualcomm.com

Results:

v4l2-ctl -d /dev/video1 --list-ctrls
...
enc_mb_roi_delta_qp 0x00990b92 (s8)     : min=-31 max=30 step=1 default=0 dims=[139264] flags=has-payload
        roi_mb_size 0x00990b93 (u8)     : min=16 max=32 step=1 default=16 value=16 flags=has-payload

v4l2-compliance -d /dev/video1
...
Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Total for iris_driver device /dev/video1: 48, Succeeded: 48, Failed: 0, Warnings: 0

./v4l2-ctl --verbose -d /dev/video1 --set-fmt-video-out=width=176,height=144,pixelformat=NV12 --set-fmt-video=pixelformat=H264 --set-ctrl=enc_mb_roi_delta_qp=-20,-2,-22,9,-16,-2,14,-9,-19,3,-26,19,-23,30,1,0,-6,-7,7,2,-2,15,-15,-24,-24,-26,-26,5,-1,-1,9,-11,15,-25,-11,26,-11,7,-26,-27,-8,-18,7,-4,-12,-23,-11,22,-7,7,-14,24,6,-8,-7,2,7,-26,2,-25,-1,-3,-4,-6,-26,-11,7,16,-30,-22,-15,30,-14,-29,-11,-8,8,6,19,15,-17,21,-27,30,-17,-28,-10,-20,1,22,29,-19,-2,28,10,12,-10,7,-4 --stream-mmap --stream-out-mmap --stream-from=/media/foreman_qcif_nv12.yuv --stream-to=roi_try.h264 --stream-count=10

Validated on SM8550 MTP.

Thanks,
Deepa

Signed-off-by: Deepa Guthyappa Madivalara
<deepa.madivalara@oss.qualcomm.com>

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
Changes in v9:
- Fix Media CI error.
- Rebase onto media-committers next
- Reported-by: kernel test robot <lkp@intel.com>
  Closes: https://lore.kernel.org/oe-kbuild-all/202610051710.bnOqLkUl-lkp@intel.com/
- Link to v8:
  https://lore.kernel.org/r/20260930-enc_roi_enable-v8-0-2c908f30e963@oss.qualcomm.com

Changes in v8:
- Moved p_s8 below p_u8 (Hans)
- Update Documentation for V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (Nicolas)
- Update returns to a sngle line (Vishnu)
- Update n_shift calculation logic to ilog2 (Vishnu)
- Link to v7: https://lore.kernel.org/r/20260924-enc_roi_enable-v7-0-6fa7413af23c@oss.qualcomm.com

Changes in v7:
- Add V4L2_CTRL_TYPE_S8 to v4l2_ctrl_type_op_validate and check_range (Hans)
- Rebased onto media-committers next.
- Link to v6: https://lore.kernel.org/r/20260915-enc_roi_enable-v6-0-29dd4c8bccff@oss.qualcomm.com

Changes in v6:
- Update documentation from custom to array, __s8 to __s8 array (Hans)
- Update documentation and handling for non MB Size aligned frame resolution (Hans)
- Rework patch 1 and 2 to add V4L2_CTRL_TYPE_S8 type first followed by ROI control (Hans)
- Simplify handling for V4L2_CTRL_TYPE_S8 in v4l2-ctrls-core.c (Hans)  
- Link to v5: https://lore.kernel.org/r/20260815-enc_roi_enable-v5-0-ded944f0fc7f@oss.qualcomm.com

Changes in v5:
- Fix Media CI errors.
- Rebase onto media-committers next.
- Link to v4: https://lore.kernel.org/r/20260811-enc_roi_enable-v4-0-1c9ea2405bb8@oss.qualcomm.com

Changes in v4:

- Updated Documentaion, clean stray lines (Bryan)
- Use BIT(16) for header version (Bryan)
- Split patch3 in the series to reflect enumeration of
  the platform and adding metadata support and implementation (Bryan)
- Link to v3: https://lore.kernel.org/r/20260804-enc_roi_enable-v3-0-e03b622a2d48@oss.qualcomm.com

Changes in v3:
- Updated Documentation (Hans) 
- Reuse ROUND_TO_RANGE_RANGE for p_s8 (Hans)
- Rebase onto media-committers next.
- Link to v2: https://lore.kernel.org/r/20260714-enc_roi_enable-v2-0-63683f9dbcef@oss.qualcomm.com

Changes in v2:
- Fix issues detected by Media CI robot and kernel test robot.
  Reported-by: kernel test robot <lkp@intel.com>
  Closes: https://lore.kernel.org/oe-kbuild-all/202606171554.03yt9utn-lkp@intel.com/
- Rebase onto media-committers next.
- Update to handle p_s8 in std_validate_elem correctly. 
- Link to v1: https://lore.kernel.org/r/20260616-enc_roi_enable-v1-0-fefcc4e76f33@oss.qualcomm.com

---
Deepa Guthyappa Madivalara (5):
      media: v4l2-core: add new control type V4L2_CTRL_TYPE_S8
      media: uapi: Introduce new control for video encoder ROI
      media: iris: Add ROI delta QP control support for HFI Gen2 encoders
      media: iris: Add HFI metadata buffer delivery support for Gen2 encoders
      media: iris: Add BUF_ROIMB_DELTAQP metadata buffer for ROI delta QP

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |  27 +++++
 .../media/v4l/videodev2.h.rst.exceptions           |   1 +
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |   4 +
 .../userspace-api/media/v4l/vidioc-queryctrl.rst   |   6 ++
 drivers/media/platform/qcom/iris/iris_buffer.c     | 114 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h     |  22 ++++
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 110 +++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   2 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |  14 +++
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  63 ++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      |   6 +-
 .../platform/qcom/iris/iris_hfi_gen2_packet.h      |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  29 ++++++
 .../platform/qcom/iris/iris_platform_common.h      |   5 +
 drivers/media/platform/qcom/iris/iris_venc.c       |   4 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   2 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c           |   1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  19 ++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  10 ++
 include/media/v4l2-ctrls.h                         |   2 +
 include/uapi/linux/v4l2-controls.h                 |   2 +
 include/uapi/linux/videodev2.h                     |   2 +
 24 files changed, 448 insertions(+), 4 deletions(-)
---
base-commit: 64f76d5d9fd17a5661d7e5eab2aa99218db60d0b
change-id: 20260616-enc_roi_enable-4d385c4783ae

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>

