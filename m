Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.79.117
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489156;
	b=UOrKcCW7xlbqeTCRi/Rv8AofhR7qCuiZIzp6rDVj3pEKEY2IFO7300m0djancB0xqkSn
	 LIw2lEn8mXgsQhuMBuf3by0+2C/qe/tyFHDHvGsHkEllnfr5yc8+B1COLRXy8rZhdI+79
	 PtU9IrQuM/MenMliPR7T024v//06+wGWbVlVncw+x8PFCa0dgvQ71hvkmKIrt8+wFsV7G
	 27kbj0QK0WlYPFkaheWcAXm5vxKH2Pmbqgg2iHxgCLE/Qsgwwn4krkrSB+wougNKwKR6y
	 ael2KMzPBuTx3hYsWv5nEpoEpFdkTjbp5TIPdi+4j7UoryHnbnLHh7Sf7ccKDqyUN4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489156;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Info-Out:X-JNJ;
	bh=6RRowT7xHJs8A6zNEf76Dvwzc/XBDK8xSl9XH7Sx0So=;
	b=U1jAifaNuCx3GOs/fE7bEvIzFhtOSUq/0n4JwSTnaBlYdi5gFAWHSZXPE2zr+VV1yJYL
	 JiqDYk+Fe+LPf4+wkHeqpVwiXCLVgTKpTwDwk8YKw5Ew1CMPkB1+1xXuZ/q91vpPtoGL9
	 2IHDSycueXrpLBnZGP8S5lsZ1u0/ogaCGJyHrAj20N1vPvFm/DfyccE1Q4wRcYXP5Cycr
	 ItzTQ493+PgDEVM97DZmluJi3hS2MGV4jksv2lfxN38+Pr1VzB66np7GJz/Ji0G/w8mtZ
	 HRDCo7JCe+zz+2df5ebUQwiQJebt32ULJe16ic5WtZ4gTLB/ssE4vp1OWdqe4+g7g8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=fAZBTzRm;
	arc=none smtp.remote-ip=57.103.79.117
Received: from outbound.st.icloud.com (st-2005j-snip4-4.eps.apple.com [57.103.79.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB18C60A261C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB18C60A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=fAZBTzRm
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPS id BCB3718006A4;
	Tue, 20 Oct 2026 09:39:12 +0000 (UTC)
X-ICL-RepId: 01a158ad-e0af-7edb-9223-19ee11044e0d
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGRhGXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOAl0FWx8RTxweGwRGBl0BTVAPVgoAQQtNV1V3AlEcVg1XQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1792489155; x=1824025155; bh=6RRowT7xHJs8A6zNEf76Dvwzc/XBDK8xSl9XH7Sx0So=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=fAZBTzRmS328JC55tvY1KE1xdYOmj4iuoCTTAcLXcU8GvSg30agRDemFcWznewNaASNSFZ+u3efAKvZWo5PAIXg20ChMUx+UF4GNLAFz0eIafGxxcay3OwW0mpoXnhKDjOJRO/A+mAhJfRKqlwadbWKRZayJXiyhko0HMSWhcnuM+h5vqcUIlNe8VgRBErzdfPrkO4bJjnW+rSL4al55mpbOrahulw0rujHsrHZPcEepDFJL99iDdZkyLHr86nrvwt4a+J0wl3gpK+vA6mxyL2TNSoArUbk2vK+HKySEzuzPlMoANgyGYYIboqwgWR5swUh0QYlGYnInhiUwkhePnA==
Received: from [127.0.0.1] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPSA id 2A3EA1800115;
	Tue, 20 Oct 2026 09:39:10 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Tue, 20 Oct 2026 11:37:45 +0200
Subject: [PATCH v3 04/17] media: v4l2-ctrls: validate av1 tile info
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
Message-Id: <20261020-avd-v3-4-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
In-Reply-To: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sofus Forstreuter <sofus.c@icloud.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzOCBTYWx0ZWRfX8xjb45bNmWAN
 vEcmVqjrR9p7nIp3ft6RmL6KYSXVacvnE8qJioPIOqm373VTofwVp65tDmrGUKgQnmmx00cg9KE
 W3pwTXaUgHjxkdPEC39ABO+HccZrFQ9yUnIKjQE+sjmq02l0W7SVzAbt9ijRI8ET2y619HyiQGv
 qiMowGs/rSS1Li4PO9Lk766rLjEPQ95Blo/4bABziKM7B3JDsizICp3KfS1dETwvD+p/lvpOigF
 z6mzZtDOxa+PBetif52+QYqmAFkK87duNpoqsd+mmumSCeTIG0UZxTRh7JYCfXQ6LJY+Nc7wl1V
 4R19uBV7Lyf+HubQ5vO+fcKDtr3re5Drxlv4yJFVNLR/3GqM2qZhHXWDCkgir8=
X-Proofpoint-GUID: TCqKx8od3_A5hMzFSEhBt7AyYaGn9mUA
X-Proofpoint-ORIG-GUID: TCqKx8od3_A5hMzFSEhBt7AyYaGn9mUA
X-Authority-Info-Out: v=2.4 cv=FvkIPmrq c=1 sm=1 tr=0 ts=6ad736c2
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=IjdaWMjaTc4ojD0rA64A:9 a=QEXdDO2ut3YA:10
X-JNJ: AAAAAAABtWP6bfkHQcYuEQl+N1NNC+zUHk/D/3dDuVzmbOBY6nsLiBMOnx96fHzygYtqOfAINIxg0vgm3t9qFiNshawlm7rlq2dJP2LY4MqGjwr+Ypj6vyl42J5QSt1jahEqjJkoIXsJ9tdZISPHCoEmRNjuCLFrihO0axlqUHQ+qG4xq7D2FyFyeNq78rIDGhJz2UWxFavziCOtg3mD9Og1uKJZOWLBQISZqlCE8OBDEzXmqMiqNNxGYo40p2j0K4WK9fSrn9DfgUAX+3uy8YdGYvWMaX7kcJUp3Yl8lSAuIGQv4kP88Wlg8+YtwVmQVkZatjqA1e7neRq8nzFL3p3CW4ikk5Ew8A2uiZZg2QViWv+xvamT6Dlt7fkVVvQPU5Rfhozea5QxavC9YHGQALy1VQMdkdA7KZmpTwHRExY8K7pC0e7QkropePn5wBRdgryFJTwntyZSP2WwdanU52ecFR5s+ptZxdEizMIeYEgEfu7V4tk4FSyt2ix6YOvcoOBrt/v2Fn35XnhJzWNwNASwAndWEYXHUoTiZE1G5ZB+E6gOYwQEgOsP9QNvuPNH4qdzk0oGY8ehjXEMd6ckrs8j6dZWD/oKRGK5gFGCMFwyJo5a15BjrFwWR6OMldhD9t70SUHjiAXW4N+SnN6Y5cT0tBamfXMzI7BwZYi3cXyyN35MJL69MHm+UmdDU9Pv/YAIO0QLnLVWjlcRYwRStVeRz8OmtUxwg/bw0JJksmpeCE+WolF7q1w18G1AYZH2P1ZD1SwHcMco4AdhM3/aFcnXEaB0G80kkcKjGOjeaAW26KMy34KGT4UpH+ZkFck0JckVFSn8Ume815IFsPIN0pnhboAftcQlgDYqMlUyZYUDkxU5p9tEucv0XuHpxZpuJqibAU2r46EGRYZGt56YfwsXGT9fOLXXuzPp5LzVjOtj+7clPta6dgn4e2Ij

Many drivers use tile_cols and/or tile_rows, so make sure they are
valid.

Increase V4L2_AV1_MAX_TILE_COUNT to MAX_TILE_COLS * MAX_TILE_ROWS

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 15 +++++++++++++++
 include/uapi/linux/v4l2-controls.h        |  2 +-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 661a3a25da52..922cf74c4eb8 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -800,10 +800,25 @@ static int validate_av1_film_grain(struct v4l2_ctrl_av1_film_grain *fg)
 	return 0;
 }
 
+static int validate_av1_tile_info(struct v4l2_av1_tile_info *ti)
+{
+	if (ti->tile_cols > V4L2_AV1_MAX_TILE_COLS ||
+	    ti->tile_rows > V4L2_AV1_MAX_TILE_ROWS)
+		return -EINVAL;
+
+	if (ti->context_update_tile_id >= ti->tile_cols * ti->tile_rows)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int validate_av1_frame(struct v4l2_ctrl_av1_frame *f)
 {
 	int ret = 0;
 
+	ret = validate_av1_tile_info(&f->tile_info);
+	if (ret)
+		return ret;
 	ret = validate_av1_quantization(&f->quantization);
 	if (ret)
 		return ret;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d17e41d51d2e..abdfa102a77b 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -2939,7 +2939,7 @@ struct v4l2_ctrl_vp9_compressed_hdr {
 #define V4L2_AV1_MAX_NUM_PLANES		3
 #define V4L2_AV1_MAX_TILE_COLS		64
 #define V4L2_AV1_MAX_TILE_ROWS		64
-#define V4L2_AV1_MAX_TILE_COUNT		512
+#define V4L2_AV1_MAX_TILE_COUNT		4096
 
 #define V4L2_AV1_SEQUENCE_FLAG_STILL_PICTURE		  0x00000001
 #define V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK	  0x00000002

-- 
2.55.0

