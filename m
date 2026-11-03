Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726949;
	b=F0zezfIj4s87G3b4/zzv8hLk+1oieFyadp6XOtkLf4JWMgtXm5MK7x6/sPqaPBOuR6JQ
	 LQTWnTD5jo+PjhvNRWj99WdaKfj3VVktjo13fTcjT6vwNy3uPvn/E8pPVvVW0KMbWJHQF
	 3E/VAQyjW+88fa4wjpSB+yJBuf8z7EZSZZQQHvkou2GaRIsYxZNFSNGvKJFvdPRKDyJ0T
	 nfRtGKwezb6V6HgWj2QzNkxGFEWq4hmPI8eYhj8Ces6TIeSL1LUUFv3oaAJzX3KPhLg39
	 DMicb593ZRPlGP5lb6t5rWvCqEcogQxiodIcthhVQkBulSRUHuUCP+nTejnjo1CVCog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726949;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=iqR72gspeHE5CjBpM2y2DON6FpEdmds6gdVoxGymU+E=;
	b=O7rgo4dM8EJYBbp0dCbk/tWqwYjWRWuv2wgyfwDhTZStL8BQ4MTVbneJwggFKXfdoe2m
	 aMmj2zytMpKNH5f/DvIdfGlYAZ9t3nZva5zCsYXhlibAdG0b/f/dFWgpFCX2CS2Ahv9EP
	 RxmCWp2QDyRh+hGSljhJYhcHsoZaFwvhkoz52Or4ccymlfANBpoy+ssiBHOm9hWVYIt1y
	 feAUzni45fgU4STRjG5uUU4aRBq0Se9gQDRu3ld3UMtQY30R9VCeBZyGEKZFbd2EJlBDi
	 tvtHnIki2GT4+qH/qPFEGbXYiFMckCN+xp9GT3F8ZsEJJKf9sVBOvCoJPQe/ESZ91Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Po2uG5y2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6509606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Po2uG5y2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A551F00919;
	Tue,  3 Nov 2026 17:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793726948;
	bh=iqR72gspeHE5CjBpM2y2DON6FpEdmds6gdVoxGymU+E=;
	h=From:Date:Subject:To:Cc;
	b=Po2uG5y2fIdLpcPxggLFLO/owr0+d5jkgR2/LencPdqOWLBQD773vDK9NBVrhXjOR
	 WAXti+Lb3siTAr2j/Q94NAbesY0MZTqQ8AwP2wIpTYk5zviAxlq+JoiEZizTgLkI6J
	 iJ3LJqO6mFzQKsmiD1BtVEQgCylRJFQGCDjhLHpsTu5Pg9E24kh51G6KAzLjnVsB9I
	 62SmP7UV8fWuzWnd9KJNXu8hh67GqXpu+nwU9q0Bd+Ycl9sdLCyaBIGPTo9N1+/tIP
	 iUbcFxEAk/ULpP/++1K70UxfNEiGPsFVv4XqWgL7ZGV3Xkt7Gg7h7dCq4dpfZ04Qt0
	 0K0GqhyLkO9mw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 03 Nov 2026 18:29:01 +0100
Subject: [PATCH] MAINTAINERS: Move inactive qcom driver reviewers to
 CREDITS
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
Message-Id: <20261103-topic-jessica_abhinav-v1-1-9f4902b6e5f5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDXRphpxFRGpmjIWJR1EIu6uW
 L7F/xcwRkKGOrsg4kFMS0iQeQZusmFEQUMyqEIZKQsltmUlJ2ZkJmc7208U7CG01qXxlRkqj5D
 aNaKn8/s27W/e+xnd9s7gvh9rgzZPeQAAAA==
X-Change-ID: 20261102-topic-jessica_abhinav-44456f86d8fe
To: jesszhan0024@gmail.com, abhinav.kumar@linux.dev, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793726945; l=1933;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=P8xJN3BrqVjCG485Wo29/NuRdNxq+sKmHPl0hSFkvrc=;
 b=rbSLOvfUh1yACOuxravBpkkbG6XcEYwgtIIiIP/YA2FKLvFV+VppPwdW0v+SNFh7kJrCtvvUU
 sGPRrgjg42BBCReWhZhSyBIyiSAtc42i6+3F5FX5eQhlCcJiUxA1UBC
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Jessica and Abhinav haven't been active for over a year now, move them
to CREDITS.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 CREDITS     | 8 ++++++++
 MAINTAINERS | 3 ---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/CREDITS b/CREDITS
index c6c7b173b064..b1e693d843c3 100644
--- a/CREDITS
+++ b/CREDITS
@@ -2340,6 +2340,10 @@ S: Schlehenweg 9
 S: D-91080 Uttenreuth
 S: Germany
 
+N: Abhinav Kumar
+E: abhinav.kumar@linux.dev
+D: Extensive work on Qualcomm display drivers
+
 N: Jaya Kumar
 E: jayalk@intworks.biz
 W: http://www.intworks.biz
@@ -4618,6 +4622,10 @@ S: 1507 145th Place SE #B5
 S: Bellevue, Washington 98007
 S: USA
 
+N: Jessica Zhang
+E: jesszhan0024@gmail.com
+D: Extensive work on Qualcomm display drivers
+
 N: Wensong Zhang
 E: wensong@linux-vs.org
 D: IP virtual server (IPVS).
diff --git a/MAINTAINERS b/MAINTAINERS
index aaf2825ac945..afa7237bc9af 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8486,8 +8486,6 @@ F:	include/uapi/drm/msm_drm.h
 DRM DRIVER for Qualcomm display hardware
 M:	Rob Clark <robin.clark@oss.qualcomm.com>
 M:	Dmitry Baryshkov <lumag@kernel.org>
-R:	Abhinav Kumar <abhinav.kumar@linux.dev>
-R:	Jessica Zhang <jesszhan0024@gmail.com>
 R:	Sean Paul <sean@poorly.run>
 R:	Marijn Suijten <marijn.suijten@somainline.org>
 L:	linux-arm-msm@vger.kernel.org
@@ -23100,7 +23098,6 @@ F:	drivers/regulator/vqmmc-ipq4019-regulator.c
 QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
 M:	Vikash Garodia <vikash.garodia@oss.qualcomm.com>
 M:	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
-R:	Abhinav Kumar <abhinav.kumar@linux.dev>
 L:	linux-media@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained

---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261102-topic-jessica_abhinav-44456f86d8fe

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

