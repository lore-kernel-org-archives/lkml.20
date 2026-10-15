Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92034547063
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792024618; cv=none; b=oacgFaz8FS0lP9l++r5snIiSVMHD3+W7QEgzhmdnMEUh4M0sMOQxweLG3MoUkPsOP75nVTRDFVNtjM5vta5ZMndUED1+S9pcflcG6HV48T3u+USSqPWWO7gTzaLjElNYkKbvB+swPSOvan5iV5kAArmzZbMwhdCJ80kEpBZY3P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792024618; c=relaxed/simple;
	bh=E0+VeT9tm+vZYltOxt+1BIvDMbhjzaTt6pQ1L2g5Hac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rfb6TfFGilG9/MeWuM1uRY+NUxcPB3xrAde3F81stkiJCC0bEp8eJqY+eH+1H+jKqGq3oUrbn41UDPnN6dry9m7JKDRBh/CFGkJ7vHYols0po3ZGXADl2lpL+55DaUyzMcbU0gcc0RziWMYu6fzm+/HOm71QevFOWStS0mdD+aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=aod3LhyS; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=OJJznXqA; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="aod3LhyS";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="OJJznXqA"
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F0Xj1k3199180
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:36:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=MBFZjRkNZaLoShz4icw9A3S4SC
	eyo+a2ZXrJLss9QNk=; b=aod3LhySZ+NXWVh2m0H2+yut1FEa1vAOQroJDPUint
	FEj6ttWUf5Lu+8EZmo7pedsBrNjplnHEt9zmNz0GPV9r9oryUjV5PoiJZM2TyQR4
	04p5vX6Xb7eGMkwHSACIQ99xhlAkfb3Dyp2kHE0TYw9gJGu9i61yArUvYd6bwpIH
	i5GKozMp0A8UThOEp1RCtoE3DlTbB2lT8PQEWQD5YU6+bNsZep4zzDTmB5EizRev
	0kI5O/luy9jNowfCc6PvlJppgR43ShHX8Dd3MtQFDvFFCMg64kR8Gh/hlsnRquOs
	SQ83EM1ecsQoEY3vj/SNoCOi5A+KhmD71lOvmT8BlPtA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hah5719my-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:36:55 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91961d4b31bso100153266d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792024615; x=1792629415; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MBFZjRkNZaLoShz4icw9A3S4SCeyo+a2ZXrJLss9QNk=;
        b=OJJznXqAey9rYCbcDSJtx3LhhObrnzlOPAHbczZPWU5WXUk5U8V/00w3Cc3f5W/zev
         VPVZVRvTdMVgh5oV5NK07AXZyWqB0xw4mvxbJ2gGNNj7TMWsrGAz2t6aMAFBHjcmVIHD
         lHPBEaK1qtHwmMOSM0nolzENp+Oy15y9OjYMZubuluJ0tJA5EjFhMK6VXcKDLnmhNFuQ
         nvyaHsTWUd9ysyAeZyZ7vRuWxP7zMUIpLFJ9kxKOVJmS8J3kpfssO1MEUxzsbXqfemqk
         c+uIKOiHevxW2O+zdo8SRQYFEwTgPuWRIhTXQKO+5OsajAQvM+KG4eXUOkMYEBJDd0Ox
         /MMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792024615; x=1792629415;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MBFZjRkNZaLoShz4icw9A3S4SCeyo+a2ZXrJLss9QNk=;
        b=DarFC2+7eDAz7KRfni7ttv8DXN3u7EWKnUzN6X1C5KkfYv6Qd6pt5pRqWVQGrotnjX
         eXmPnK8Vq7g8yjqhcFmIOYFa5TLnAyD8+C36k5+w/c7INZTUg4yZc7/PiIMKcBeMxmHD
         fqVRsFEa0FG/+ofuXkSTxHXukJ5VlJKWdJIxZ1JAmG3dq2C6vdmj3uFyS62NnyspNXC9
         zqoUHRIbh3K8Y/tjWfNshPueWha+GLsCV7gj9pjG9/KRmBTo/jAuh8/R0naaXdkarsW4
         sTpXfgJjXt2KrLWurToopLqxv7PKC4qhLOoy+niysxJn2A2/gAGHkFvg9/gtDEpaqRW2
         6xxg==
X-Forwarded-Encrypted: i=1; AKwUvBzA2o/ehBWvmFG2EuF7is72fSB1REvwPYVx66UAyHmqh1ftA0BRYErtUfg/AWp9toGIF0ShFW8c1Ej+XaU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHJhgLkXZoJrpom1657+iKkcItOgoffKY14mDe5HWhFJl9dgts
	yOAPlnYGhdIJ8TqOdlVr/sNhbdP+3kdJ92dGSgZBkUdAl1ELxRmrReGWn5b/k56S9DT6QLZraUO
	OpnC5g2Vt3N2UgYFUq0JZTiN1Y3S7Srk1b8+CY7xqB1lpEl7f7UBexjhhtSSiLQ==
X-Gm-Gg: AYBFou2Rs8ZU4wPqOM59N+8+w9LIio9QnutEwzxi6EeOfKvzhvrp6oGjURqR/Is5Ib+
	wpmckXZTVCdNR726oKvXRkILm5BpU1yiJP7YBOHFayLXAP9b0AppaG3LaMJvtMIdEmImA3HJEr/
	4OZRYyuG6ZRmI6qUKL9eEZNYaoq9QvZDiPC5e9SzxPCOqa6T6CTNZLFi2+N9nLlHXU7MfF4cIi2
	yfW1LAfLNHVp0bV3p1wQCpjwJ9bGoAsoykvxx5sQ5BVL5fdSNw2n2hRq0mPhvmq1RJ9nqbOHNyj
	+fisdJmmRUR5VixnLRZHDKGAhvQ/Se0dfdoujYCGT62061yxPKhY2OYfBAu3yhB9o2IfUh7cDBr
	y9aKYdMY0u4SxKsDBBQHmSkB/YpkWROAAl30HKqYqjzgI
X-Received: by 2002:a05:620a:3713:b0:93e:6ee0:c074 with SMTP id af79cd13be357-93ebd260beamr2867280385a.38.1792024614748;
        Wed, 14 Oct 2026 17:36:54 -0700 (PDT)
X-Received: by 2002:a05:620a:3713:b0:93e:6ee0:c074 with SMTP id af79cd13be357-93ebd260beamr2867278785a.38.1792024614259;
        Wed, 14 Oct 2026 17:36:54 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef50095a5sm630842885a.12.2026.10.14.17.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 17:36:53 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 14 Oct 2026 20:36:43 -0400
Subject: [PATCH] gfs2: fix the escaped block copy in gfs2_before_commit()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-gfs2-escaped-copy-fix-v1-1-ff917ec48fcf@columbia.edu>
X-B4-Tracking: v=1; b=H4sIABog0GoC/yXMwQ6CMBCE4Vche3aTtgomvgrxULsDrAdoumg0h
 He36vGbZP6NDEVhdGk2Kniq6TJX+ENDaYrzCFappuBC550/8ThYYFiKGcJpyW8e9MXeta1Ajuc
 oQvWbC+r86/bXv+1xuyOt3xjt+wc6WjoQeQAAAA==
X-Change-ID: 20261014-gfs2-escaped-copy-fix-1055ded37add
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792024613; l=1502;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=E0+VeT9tm+vZYltOxt+1BIvDMbhjzaTt6pQ1L2g5Hac=;
 b=cptjR8Wi5QYajBKi+2dNzereqKLFdldPrIPDRcekAy3LT29s8G+h9DpIpWr8+FkL8erFn7Qus
 8HR7V17pv46DIQK7gtNc52U7+DONYjsDgZQ5QkgdzlGHmHSnwIYVIKH
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAwMSBTYWx0ZWRfX/R4FFlEIWGn3
 7vmc7MHUQ1MZrNM8aH9AOSlh1rV1mKbDAZQw07rwabGVJQ2KT7uBBmNmkyLNiopXgb6KmMd4Cqj
 LYPUhSLqXz87c/x5tHxQbFTcOu97YHGDJWTnnQfqltwrfiXKVl1cAwHpTLRKO73DxTToD7RR8Wf
 WauA/EL3FTudfzF0dVJ9qsr4lVRkZfpEYhKXthTGpJjDX1bMoXmXU3jJA3L7FosKWqzfjzjhgs0
 kB2+yZLuESu3rhTgtipw0hXD8WU2DdJrn31//4Kc1WujXl4oZgP5LSX/tiXf2LL0zv2KnkmxaV6
 PG9DvXGqoIo7FIlDOR4CkLV8WSJnNEZKt5Z/j4py0Q7Rhswu0DA1z/QSDztzsFl605aOUKxQWX6
 TQUhggQhAS6LPzp7eRBDCtr0dMSDzz+p51/XlQL9VNXqlXJirMo45Dx+OCdbxHKvwqge7ZGqBmz
 h3izcfaMmzmvuSc4mUA==
X-Authority-Analysis: v=2.4 cv=ZMJCCn7b c=1 sm=1 tr=0 ts=6ad02027 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=VwQbUJbxAAAA:8 a=bvDx6QY01viD3ml5MkMA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 6rZfbaLXNMyUZrk-an9wDdS18khM4C3b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAwMSBTYWx0ZWRfX94e7A9wcEolf
 5vr+c3wo+/9DnEPdkblVlOp7LZrOBY9U1A7Wsvgul0uCmL/AHg4iaz3soJUQ1kpG8Q50+ZEsMDy
 UtOtf5KC+8R+rBmemobBXhzdfMBW6evyuja6GsR4s/610oPvgsHA
X-Proofpoint-ORIG-GUID: 6rZfbaLXNMyUZrk-an9wDdS18khM4C3b
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11935
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=10 impostorscore=10 lowpriorityscore=10 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150001

Commit d68d0c6c3fc7 ("gfs2: Use memcpy_{from,to}_page where
appropriate") made the escaped buffer copy read from the mempool page
it had just allocated instead of from the buffer, so the block written
to the log is whatever the pool page last held. If the journal is
replayed after a crash, the block is restored from that and the file's
data is corrupted. Only escaped buffers are affected: jdata blocks
whose first four bytes match GFS2_MAGIC. Copy from the buffer's folio
instead.

Fixes: d68d0c6c3fc7 ("gfs2: Use memcpy_{from,to}_page where appropriate")
Cc: stable@vger.kernel.org
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/gfs2/lops.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 77ef22eab368..16fba2108a4f 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -689,7 +689,9 @@ static void gfs2_before_commit(struct gfs2_sbd *sdp, unsigned int limit,
 
 				page = mempool_alloc(gfs2_page_pool, GFP_NOIO);
 				p = page_address(page);
-				memcpy_from_page(p, page, bh_offset(bd2->bd_bh), bd2->bd_bh->b_size);
+				memcpy_from_folio(p, bd2->bd_bh->b_folio,
+						  bh_offset(bd2->bd_bh),
+						  bd2->bd_bh->b_size);
 				*(__be32 *)p = 0;
 				clear_buffer_escaped(bd2->bd_bh);
 				unlock_buffer(bd2->bd_bh);

---
base-commit: d0c4bce31a579216780b990a09250f15e00f38ff
change-id: 20261014-gfs2-escaped-copy-fix-1055ded37add

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

