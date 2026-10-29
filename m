Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281015;
	b=TDeMC/TK99KmRagkJseD0Y7pB6FJv51Kp6oIssbOqiBBY3U1RajByoXwNS704Q405iWM
	 lckdo7/im2LbCKdYvphGadbGQFkmZXwrgKDT4JIl1O0+LF1dEJpUn1KpLhfVO/hlRD7e8
	 STKeLn5qBtpCFDvDw7ESBVsaL4LeSPWL1xnhu/ZJIpRIgAoi37IRikteccj1JBRHa0gvP
	 4d0F5wFSgpPY3a5NesSgRu2O1l0X4xfnno5sytM8ElpM/Xgjkp4g8yWwhLAvlCNx4jDnv
	 PlX0g/0s7cgUWOfaFyNXPNtWTVOwbwI7OdS5xVJLu+84o4iVqS6dQrco5a39bJUNmBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281015;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=XWixsvkjfQoDzoGkXjo8KZzGPvcGFb954ro+EZFcpJY=;
	b=llPW8rKpx3/q4wFiVAbVBkoJzQ8JhVlgTYQfsR9z34M9PZq3K2UcLbIFtc4RCk5I8Eiv
	 b/rk6srJxk7sj+LmyrGDcP2mzM/KiwIse6na9Sdi5bDnNpHCR7fhGrjBRtsChy8o4pdxK
	 YT6q/P4OmMyHhQ7cFPUQuxMA+hgxnt/hTtpHyC1quU2zHbKnPRXRKu+/09I1cQr9gk+by
	 KkIFoNBuJ7g5XT2b0spLiK2IKJxzMwTBxmnf/wVP86S/0Gm3XKbFHdePZRDpQHhzajMIS
	 w8Bxvvjv5Kv1fQt5gvLwM8usTNV5YLZlkYXQXEB0DsJxrxUxEfm9ljTnGX7TaZYtpEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e0e4NsD1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9308F606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e0e4NsD1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5BD21F01828;
	Thu, 29 Oct 2026 13:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793281015;
	bh=XWixsvkjfQoDzoGkXjo8KZzGPvcGFb954ro+EZFcpJY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=e0e4NsD1lGvKyqrV3VnfNphHmz5FpKLiKO4BIxxKiZ21nSsM6gLVmal7MUiHhR5gU
	 TbZzpATqrufvycnq3jqqkpxkgRuulWOSFdPxSvepnZh7pBTGYL5vGB4uPpM4qBf8F6
	 1otU3j1YSFuHKHylmHFHaZdrGjZKBcCf10DhwvoxqRsVdi+8F2omHx0Mv14mFdP+Oq
	 hlQqQakwTNO5FoJhSNxs3dMUVGlCExEDlLScNKDkpCw/JXEFOfoYU2lARuoDvNG46j
	 B6kT4+tnOTpcgLdhql5f463Cij9jN44vFQnzH/9xLdGyWp+u3bEcToxFTqW23mcW4L
	 hHB5JgBtKTo7g==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 29 Oct 2026 08:36:12 -0500
Subject: [PATCH v4 25/31] accel: ethosu: Restrict dynamic IFM2 weights
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
Message-Id: <20261029-ethosu-fixes-v4-25-4aa25e22578e@kernel.org>
References: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
In-Reply-To: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The validator bounds dynamic IFM2 weights as a 1x1 weight matrix, but
did not enforce the corresponding kernel shape. A larger crafted kernel
could make the NPU access beyond the validated IFM2 feature map.

Reject dynamic-weight convolutions whose kernel is not 1x1.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - new patch
---
 drivers/accel/ethosu/ethosu_gem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 406e1c07246d..117046e5a61f 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -598,6 +598,9 @@ static int calc_sizes(struct drm_device *ddev,
 		    !cmd_state_reg_is_set(st, NPU_SET_IFM_PAD_RIGHT) ||
 		    !cmd_state_reg_is_set(st, NPU_SET_IFM_PAD_BOTTOM))
 			return -EINVAL;
+		/* Dynamic IFM2 weights are only supported for 1x1 convolutions. */
+		if (ifm2 && (st->ifm.width || st->ifm.height[2]))
+			return -EINVAL;
 		u32 stride_y = ((st->ifm.stride_kernel >> 8) & 0x2) +
 			((st->ifm.stride_kernel >> 1) & 0x1) + 1;
 		u32 stride_x = ((st->ifm.stride_kernel >> 5) & 0x2) +

-- 
2.53.0

