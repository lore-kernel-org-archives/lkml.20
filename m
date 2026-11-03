Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699731;
	b=uSaS4zKV+ZL8ZqNxjRA0GVSZnUuUmfSoXPPFgZwv4oVDnEFLpVr07ax6SyJk748YLLrf
	 XL4nGlVYUrUDLOue9LZpWJBbGdlJKU/bIXY6uyLz2TN20+J8Driw4CwBpjK5gslULT3QB
	 JGd9Li9XJC5Pj6pNcxaV6xzBhj3rpTQUKSdxOrnmKRer/SWPkAt854sSnN7poSnY0G/L8
	 o/z/sd+0WQRi0Gz+dhCHL89Y2ejj2y0jf/e5BsHFzCj1NyIbmoz/4ECLfEyT3Df3Fdj3s
	 bq/p4JmpceefW/+81ehGYUioYhcRvOpujyfNFAzvTisnJA9iFvmjXiWrmXjat3kgy6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699731;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=hAWeJkX9LYLxFCNnbAdY6nlNLyT4I1KvYp1i5/keNMM=;
	b=Q7EluYbFGLg2S6CtAHC/d/5/TlfSzTIajVXNW9uOK/dRrLNL4e8kL3i0krmnM2IBrJWK
	 sabmGpsyF/HR3l/OLwO8S3Klzx5u8OAz1g1aLFD3iNhYNoztYf+2/C8ylQCl1JwSXqMJb
	 Q2o1ypGu2PtAmzRoDwKccbedG3gDy9Otg1C1VQlFR4i7iAUyO4Yu37SSJXMkLX9WGCCNC
	 Dm8/2j7SxJz3DDz9SmrYZtqA8NKb1JjoQ8uBZ5ReR6LDhh/8PMcUjJ1FIcs3TNzn5AEjW
	 jBWtB56jvURGfya6v9HqkCKoedBtSjHzM+KOd5N8ELBMbbo+p/9DkgbPPHvU9U6Sv8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mdbml1y3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5867B60A5BDC;
	Tue,  3 Nov 2026 09:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mdbml1y3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E7F1F00A16;
	Tue,  3 Nov 2026 09:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793699730;
	bh=hAWeJkX9LYLxFCNnbAdY6nlNLyT4I1KvYp1i5/keNMM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=mdbml1y3xoVdNuQ95obpBdzmSRcI9DS1w+DwG8Hn1M4pDUcXKTwJbNrqnX2MBYJht
	 MVws7ZWWWsEA7jz+bi16USElc283bunJHWmloLjkag3y6dNqo5KddSuRW7dKNywMgl
	 l2eJBM8lAUjYRMeYj8wmigzBFm0yZJnydFjlB+EXC1J/kEjP/wVTPREFuMksmzeBDp
	 3POuvP6sEMd2q0xyhmZMvHft7q9CWNy0doYtePYeywdrRx7+hoWiNEjVVRy+Emyjqp
	 68+4kpdVzurp1EdLViXF4CMtBjiXKwKlzEalbyStZtAhCvTG2aUtollf+zzKaKxqm3
	 xUS8lWvFBFFsA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/10] soundwire: qcom: Prevent pconfig buffer overflow in qcom_swrm_stream_alloc_ports()
Date: Tue,  3 Nov 2026 09:53:50 +0000
Message-ID: <20261103095445.81414-7-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103095445.81414-1-lee@kernel.org>
References: <20261103095445.81414-1-lee@kernel.org>
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

qcom_swrm_stream_alloc_ports() allocates the pconfig array with
ctrl->nports elements, but only checks that the assigned port number pn
is below maxport.  When multiple slave ports map to the same master port
via m_port_map or the stream requests more slave ports than
ctrl->nports, nports increments past ctrl->nports and writes out of
bounds of pconfig.

Verify that nports is less than maxport before writing to
pconfig[nports], and clear any port_mask bits allocated during the loop
before returning -EBUSY.

Closes: https://sashiko.dev/#/bug/linux-543ea0c0-a6e5-4b03-a041-ea0a760802c1
Signed-off-by: Lee Jones <lee@kernel.org>
---

v1 => v2:
 - Also check nports >= maxport and clear allocated port_mask bits on error
 - Drop Fixes and Stable tags

 drivers/soundwire/qcom.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 6e0c5fb10efa..29130745c809 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1350,8 +1350,10 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 				else
 					pn = find_first_zero_bit(port_mask, maxport);
 
-				if (pn >= maxport) {
+				if (pn >= maxport || nports >= maxport) {
 					dev_err(ctrl->dev, "All ports busy\n");
+					while (nports--)
+						clear_bit(pconfig[nports].num, port_mask);
 					return -EBUSY;
 				}
 				set_bit(pn, port_mask);
-- 
2.56.0.385.gac671c819a-goog

