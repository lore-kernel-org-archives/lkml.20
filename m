Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CE92D12F3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790047710; cv=none; b=LLFTrxuXZ0XOFwUsMihqs21awGi2EJ54yIF+j8FGf+SNNi3jyGtviVVdAODfDSSeb9ZxCBcuw45S2p1Jj7Ni/FTAfQG5DtJE9B5A7ByCq5/fY1gkFOi1VEHxi4fvElUVF98svlmrXLlGOuO1DPHAIdA2PcpqrHO9iIDsvJuIi7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790047710; c=relaxed/simple;
	bh=Z1KhIZQh+4x3Q0ktYwIw8k26fIY2iehPf1reLJe/bVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MdQDMzz+L8YIpiA7+iwuTqWvlL3jZfle7qRc5sZFk6Upq5wUttOvO08OVlHP1MVQjce7ts7xMk+KLE8z5A0n3DRAP3cyQovNcdhqXgBVhcJZhuAUqos6eDB7qNmUlQDnZGqyFSqPLJHdR28eL/HvO+bQD8DmX70FJGJU55pQgsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J22od+60; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/+mwJqy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J22od+60";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/+mwJqy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00QpJ2674232
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jzs9EY5/pGvizLD9pD+AQ7
	uVVUr0coQfu87mP0icE6M=; b=J22od+60ACKaV16yWn095QkaQPq0dkmTmJvzLE
	jAlm1QzqeNPRhunQlapVROTZZeGy+6vl/4NV8uA1e9fg22l+3kDfWr/Exr1X5Nmy
	soESSK0ysd3gJXp2sPW+onAYPPghMiQs11f7YWVvpqlDCM8jAyrlQwDxyTw203+F
	E/ntjvqPlfq8QvC67hg+EJMz3JMRxrAek627twFGvKlsMAqqUIUnOUoNJ5AApnDW
	FjfcI9lgQ7Wf+VPlHP9MevcLuuwVq6C0Q4dOmVlnNpKm+9ObvyqetvlGfShr6NX3
	H3vwV5TcULdCPtputOnURy3K5o8eGbJrMBSvCdcgN68Z+PDQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8w7a0d3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:28:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso1532786a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790047707; x=1790652507; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jzs9EY5/pGvizLD9pD+AQ7uVVUr0coQfu87mP0icE6M=;
        b=h/+mwJqyn79AYcBU1QQkYDG4b63bgEd4JsAZ8h6o0LVJEUR3phOZhQQ6Yul6ITBeHb
         /FtN9zAKaRLEu7bbdnDk09/Ve7+f1iDcVF3oJVxRAb88dr816DnKqfzKckou6CAod5Vq
         wlugztlCM+awGuhcZ0QZci4N+F4w7+rcoowhmrmFz5zwzYHJ6N5XMYUaQFCmz1Y4pkZH
         Z60aWsAiTNKddl9Dnkaf5GMKh3Eatm0i6ADkTxk/5mebrDbePtR2UJT6RGSiXVhKuFxs
         ZSYil42/SK5PIRn2qjyk+1igBJxg6HLR09cSACDmElwvUQAhHjbn8ywehL1Gfxy8zwDB
         zpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790047707; x=1790652507;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jzs9EY5/pGvizLD9pD+AQ7uVVUr0coQfu87mP0icE6M=;
        b=iimoXqx8ghTHCiIwR44Ozo7jqUmOAplhkZbL8ibp//7FBGLXtmUaYIjyfGo0RhfkA2
         HI3gP/F4aKH7ZBnd8trPGL/6pqk42w0kpHvPRsQaQrI7Q28T37LDHpZ6rDwpKkFB/8FP
         SZ6oOfcp9LAS4g2QHy6V3TbeVOyrtGfkG/xgMpWoQSjncjAtwyolRjrDEY642TDrZ7+8
         uXnusp1JlFCh9P0OPxt9ji3DCXMUtXy5EWtcQaU6U+nRo+32yecS6lAlq1FW3DULPYw9
         CNo/0OJJENLAw6XEFwYY6Sge0eQvZz6RMCKJFaUtYZZndo5YHveYr/bMTGDynd7v7cGh
         4Dog==
X-Forwarded-Encrypted: i=1; AKwUvBx6JVyfX+HoDwQG6CIVr23L9Zd3TmvVBu4Vvh1pvamQzM/6qtVjgxfIHvj0rw6p6z+bN6HY+1NaPZsFZ9Q=@vger.kernel.org
X-Gm-Message-State: AFuF++m4/tazq4rmMkxt4xNQSKESJ+nRFxf0lGh3nmQaFQw5UaR10q4S
	WqlzI85mxHCnM545VjlRIvFC8JfkY0zduOm4JQl5YplHGm8Ri4/xvJPcAgdiv8DTP+QIT96m+zV
	3N6V09El/emsb/zWiTV2RWDfd0JZcpeVBU8yEdPznB8YkrrlTxagjQN08xyggbpRIM6TaxkxWDj
	K7pw==
X-Gm-Gg: AYBFou1mqjymBjcytkf9TJ6DlKKA+mbOxgS2QqUrohP5UPaGGRwix2sanUfUAE4vM0z
	+tD+OU7Ct8ulqZ4EpjZmB/szWa9o1ztW1GK/pOjtVcxjzvIZU68iCfzEu6komLfyYZaCwFsJVDQ
	lb2AyubD4OHgZXUMwzqY6kTJLUbg94Iy2VhXACm0UwLUCwiqdEa89zpHg39sE0T/Yd5OOlNnCry
	HHAoA691OQoHU0EqujqZOjP+NvXJRh8jMY3QvqDdmaJHkDHxM5cPJ1diOM8DAp6ulh4NaQSWCe1
	+DD37a2/n8gvedX8okJxOFoLsXTfOv2cLqsnSifrtGGVSjkqjK2TYvM+/fKvejbsPAUKa4XdFZX
	gOgHGndQYadbHZdqu+y8pop4fMcwxMYe13MtEUJ0ugnqbeX0VsXrMLVF2N3vlmKz9CHp1ggd26x
	A=
X-Received: by 2002:a17:90b:3a50:b0:39e:6a82:afd4 with SMTP id 98e67ed59e1d1-39e6a82bbb6mr13645329a91.38.1790047706660;
        Mon, 21 Sep 2026 20:28:26 -0700 (PDT)
X-Received: by 2002:a17:90b:3a50:b0:39e:6a82:afd4 with SMTP id 98e67ed59e1d1-39e6a82bbb6mr13645312a91.38.1790047706267;
        Mon, 21 Sep 2026 20:28:26 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e574c49sm681817a91.8.2026.09.21.20.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:28:25 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 11:28:21 +0800
Subject: [PATCH] media: iris: fix VPU4x encoder line buffer size for
 rotation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-vpu4x_enc_line_size_fix-v1-1-f0ee5556bb0e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANT1sWoC/yWNWwqDMBREtyL5biAvo+lWioTkem0DNdpERSruv
 aH+zTkwMwfJmAJmcq8OknALOUyxAL9VBF4uPpGGvjARTGhmhKDbvKrdYgT7DhFtDl+0Q9ipAC0
 cA+9405PSnhMW/V9+dBcn/KzlYLkk8S4jhWkcw3KvalC94tpopryUNcjWe2iMBz4Ak0wJ05akB
 9Kd5w8KQhp6tQAAAA==
X-Change-ID: 20260922-vpu4x_enc_line_size_fix-2c62a0cba17d
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790047703; l=1510;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=Z1KhIZQh+4x3Q0ktYwIw8k26fIY2iehPf1reLJe/bVQ=;
 b=DuCmYXfhQhuws9RwZ/nHHqEnvVP4KOhkt1h8EQ5S2P8bzBqijmg6RCF2r5sUXLRPxXmrF2Kqw
 +dd9Llg5aN8CmQUB2sWtj9euC7pFBO2jpnao5Vbh8xP5LQvjTh7HrFz
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: tI7_QkWhj5kzehOW9KgM2ewH2TrLTyKg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA0NSBTYWx0ZWRfX2f4X8g7jNppX
 chwhvaWnf0r9/M4kVy1//86UxPQ/TV/3RSiCAt7tRekLG/rKqEcIu+fUlan3JcoMP5Iekec3Zij
 uzPJnkdVHZmQ7As9px9grxklcOSo0sPAm5JpURyOCGUUglF7FiWn4rPillBfXGjf4IAAFbnERgR
 RCN/okRfvstA3Ry7kfsEMDlHfu68XwqOBOwu+rTzav1GfAFDrbYcCsUB770UgIsQmhN+MurNlqZ
 FE7/39HxcJOF27hA5CtEeGMrtVIfTEuH8FQd+K8DUOPJy3DmIihAPZToCHP3D5gDyhDp5j3NF46
 LK3ix/aXPovrAaXh6AEmsVu3OjjDFoBLapS71RMcl94SS3SxIGvFo9uWFhVsfZ4Vhu0y4CXd98E
 us5DWFFpPsT6aeuJpkaRq8aBPEUHPPXQ3+KTW8BaAKSe0dwHL/QE1x5Y16gWiW0bXsSVOphtefg
 KZT9ckR84zekh6pcCjg==
X-Proofpoint-ORIG-GUID: tI7_QkWhj5kzehOW9KgM2ewH2TrLTyKg
X-Authority-Analysis: v=2.4 cv=Vqi2kO2n c=1 sm=1 tr=0 ts=6ab1f5db cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bmUCsug_us4eMR1eXtkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA0NSBTYWx0ZWRfX7PL3ZuJpadIS
 6C73WEUwkq7V+qYs3yQA0b1YtSsYERlVtrwdFbD6c0blkC9QiGfAPxDNwM5m7EfLD8NP1aWnt1N
 01u21QiSUYwtka2ltG01iYZ1PnCkQXc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220045

iris_vpu4x_enc_line_size was reading resolutions directly from
inst->fmt_dst. Use iris_vpu_enc_get_bitstream_{width,height}() which
account for the 90/270-degree rotation case.

Fixes: df816dce1b01 ("media: iris: Introduce buffer size calculations for vpu4")
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index faebb54728660cc621f8822dabf2e44ce8c55c58..b3aa495ab371fffa351c61b3410e26a50bd11a94 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -2042,9 +2042,8 @@ static u32 iris_vpu4x_enc_line_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
 	u32 lcu_size = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
-	struct v4l2_format *f = inst->fmt_dst;
-	u32 height = f->fmt.pix_mp.height;
-	u32 width = f->fmt.pix_mp.width;
+	u32 height = iris_vpu_enc_get_bitstream_height(inst);
+	u32 width = iris_vpu_enc_get_bitstream_width(inst);
 
 	return hfi_vpu4x_buffer_line_enc(width, height, 0, num_vpp_pipes,
 					 lcu_size, inst->codec);

---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-vpu4x_enc_line_size_fix-2c62a0cba17d

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>

