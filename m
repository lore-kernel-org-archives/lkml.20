Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC05C56C652
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790096313; cv=none; b=f717m5N8pIWR20yGmeFbdZq5+nmi1s0ZsGAbXNJGofbKmpw3whU+QZVM/eqnVvY1sL6fAJN0wGCvqbPFut+vb350OAeo6Aju73a45DI1FlrprZBaOmvOZzfifbfswRKaYS69sYHMtUvaghwrJECLW2NKNWHtp5D8DjwvNpTE2FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790096313; c=relaxed/simple;
	bh=Q2oNZnZF0RuwKE57dbelijaEFxtwpHSXaVnTUH56ErQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fF6K7BQPp0J1ogLi49N4sJB3yVbfVgluolfAlGAZorKY4/rK3X5o5f0RLIPc41bzIWV0iO7xGPkCtT1RxKA40Sqwgs/9nN7aliEZD30/21fvTIGiQ+IQpGVy3q2tm5Gd4+hM9vjx2aUsh6kFwMj/j0mBBgXAWdBeHjYscHf6+AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O8Y20SBi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NqwtEX7/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O8Y20SBi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NqwtEX7/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MG5q4l884502
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HWbXsFJPbLflZBrmECKjR7
	5TjnySrlY4w+9Ig3q1ts0=; b=O8Y20SBiDAe1l1FvgDUe05bGa/ZxkhzlEgdy+g
	myAoTRYGnBYpMGVp8ERaiWMVkHeS1qFWwiAaya13bTLO8eeltxXmf33ZbyhdD9Tx
	5QnLqcZnv58R4tavu0liDN0GOscbwFt7w1kJze4dN/jrogCRYb0n4+SDUtUFzihA
	/vq2HkqvVAni3zPL0EJK313HcrfqLdhvFs1JJ9o5DaCjzIxuQlFvbulBPVCpP8UO
	65TWUIywpa395feghh86szO59Fwn+A3yfLVQwo/Tbmgk+XcNXoInppyXCVUwJypU
	cCnWvqV26rIyjo0Pf/hEn3DWxyOBMfZog+zsOadinsH0vj3A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guvw7g7rt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:58:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so131019a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790096310; x=1790701110; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HWbXsFJPbLflZBrmECKjR75TjnySrlY4w+9Ig3q1ts0=;
        b=NqwtEX7/9Yx9or4W7FX+i4pgrGZ+6sD+RBzebQYMm1iAR6S+5XJxrsT1AcRQhPUy67
         srNn3dadztpYxPUoMUT1yUWLRuQVtpmbSd4tVyiCDdmvEqJpyz6hF5QpA3OJcUsNX1H3
         HuU3r5vra/KShhxXQcUI2qeeD/+bLvXiBVPKjHyPU+qe9y4zCHYyOX2RC8K+2RESZJXZ
         7sKHabweStCY9WEBPrO0HVIDYgoq4Es4IktoA3aFEa9+Kwn07jpt8fWY4eTrLbK7EwG8
         3nEnttrvD5B+VvH/UKwvrRNmwVGv3mtgblVS7TAYF/sWsUSi1k0KCjuM9zZuRqzEQbWy
         aRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790096310; x=1790701110;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HWbXsFJPbLflZBrmECKjR75TjnySrlY4w+9Ig3q1ts0=;
        b=IhgVFzB7WTSsQyTyrVHm32mi5pEaRJAOQtExFmjr3uga5Cg9zD5rIMJD3C7izfyLGj
         zXKYCUo8IYnGBN2CYxyaaKeQr7kyFFOXRPsclzOP8nP1iM5IBxKwm3tl47j1vUwjnu4M
         SgZnh0BQd68wWMnZ0bVDFg5NaguAUfpc63flIb1tSmvJIt6mC6L2S9hHA08pEWnTs0MR
         gTwV1cK+mqJpAdfacze9wen8X1Oid1p4SeMqltedEOQGzbRX573DEEyTMceqUGGQvDm3
         nLoaUrOdkfS/dxNQ5nkB+mG2HdG/GDuUymIxktb7aDXJInRC3qF3KOT7J1UkdnSZ3kDh
         1ebQ==
X-Forwarded-Encrypted: i=1; AKwUvBzE3xaSlhSdNYWRSzacmZNGi+1LmcYo38YddecCoTefv08aWESFL3x9e/+AfGXqQZf9LYdoM/gjEnwOg1I=@vger.kernel.org
X-Gm-Message-State: AFuF++mNNeXx9imJvUGQpCu135BQYT9w09mzf0pl2z6hkpvfAtLc8j9U
	M+kuJDO0z8T82Jw4kFyApt0HF03X+3KR85ublmH/2xxMnDL46T79pPQou2FErNhvzE3No/rJZ/N
	I2OZ2CQXkna9QSwwhP5RLWNeghgk+i2hFtFP0M+JY6CmIShegGDsEUQDuqpZ49vRmeiE=
X-Gm-Gg: AYBFou2XcmvSgUqUdj2dFAO8KWCnJyeUyL5kqwI3UBR0KnOcN/t0jSC4gNs2nXcRP3A
	1XSO2CwaGDnkMZvyK9wgQN/xam7Koq4gqns/dVFBuB6NBP6xhz4t/KOTVE8YAi4BJKjQQs/j4gc
	xeH7p5aSNsBi4A8B7XL2mIF0Kr3JWFnqVKmne1YpNDPx9v5fno9sJRVNFfC0+NLydDKjY2PgFzl
	zS/+wAcfA/Ei6lbuwNi688J816ITO5g98JjiPUxkqi2g7O5KGWDbsmz5eTDn6DOQu6HDY1hEAEQ
	x7bnMIofAqruiDG33cVv+DweXiSZwSsx4KDQ3pKuVSh2yQ0ZHnijw1WRK4Rm4NoUtd0QEAz/2cR
	HVgYGcOcCgEwM1IqJwO9LvZ2jyr9KjlU0y3VM2zZftdToP8xtStjIjw==
X-Received: by 2002:a17:90b:1c09:b0:39e:237c:50e0 with SMTP id 98e67ed59e1d1-3a07e4a2554mr94903a91.13.1790096309638;
        Tue, 22 Sep 2026 09:58:29 -0700 (PDT)
X-Received: by 2002:a17:90b:1c09:b0:39e:237c:50e0 with SMTP id 98e67ed59e1d1-3a07e4a2554mr94870a91.13.1790096309084;
        Tue, 22 Sep 2026 09:58:29 -0700 (PDT)
Received: from hu-jboody-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dc7c7b0sm296927a91.2.2026.09.22.09.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:58:28 -0700 (PDT)
From: Jeffrey Boody <jeffrey.boody@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 09:57:33 -0700
Subject: [PATCH v2] dma-fence: deliver set_deadline callback even if fence
 is already signaled
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-dma-fence-set-deadline-v2-1-2338d6fac9aa@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHyzsmoC/yXMQQrCQAxG4auUrA3UQTrWq4iLdPJXIzrKpBWh9
 O6OuvwW7y3kKAanQ7NQwcvcHrkibBpKF8lnsGk1hTZ0bb+NrHfhETmBHRMrRG+WwRLjPu469DI
 o1fhZMNr7Nz6e/vZ5uCJN3xut6weRyXDvegAAAA==
X-Change-ID: 20260917-dma-fence-set-deadline-a778746e9abd
To: Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jeffrey Boody <jeffrey.boody@oss.qualcomm.com>,
        Jeff Boody <jeffrey.boody@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790096307; l=5741;
 i=jeffrey.boody@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=Q2oNZnZF0RuwKE57dbelijaEFxtwpHSXaVnTUH56ErQ=;
 b=w7w69/znW7DKQRjZ64vTloJSfKKJbep3F6kIELhdQ43C15+UqWoC8tDpDZr9mYXQqim304Ylp
 5JqoOXZ97emD8q/IM9cYC+h1hALzXbDomS9D4tHSa2KBuNFFczDdZ7A
X-Developer-Key: i=jeffrey.boody@oss.qualcomm.com; a=ed25519;
 pk=jfv+xezpcWlcNCnNmb0YYQmKBN9R4nYNB4N6GyqTBkg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI0NyBTYWx0ZWRfX7XWEbDUcD3/G
 boJEC4gpse4+Idn1UUbLrOIEiLTvwRBDPL+kC++Ar25jzUXljBiO6cycFiDfY9Rd5z8Sekzolsk
 H5OEuunWPDOPUoDSOj5woBS+oVqHz3E=
X-Authority-Analysis: v=2.4 cv=ZYqIpcVA c=1 sm=1 tr=0 ts=6ab2b3b6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ymHyVybfssQjcaON3AkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: pLzt7U39oiW2_0dsBrQp9QQmoyk_WdQ6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI0NyBTYWx0ZWRfXyhpvT+UxnUgp
 Py2ZyV8DzJy1oxrUXPYKHPJVKgfFI88RagPkhX1j/l2uqLC6zqZHgZbhjPi68WlgTwSjAEkzH98
 cwPdc3wX1jsxBPK8FE8dMWOXPeT1fxbxjkUET/gA0ddqmcxaaGPzS4AARx+KuTyPaz8AKswcFTx
 ktFApkicmlMsd1NazivuaJ37zvdy2YG0yt2ee1pQZAQLDGw98K/jL8V0e0W9sp6rWOJTXHpQDaN
 9xy4vz5lKovaMEXrmIufeRIFkN920kDSGNcSBEr3Nf2srfhAN0CiszmlWlj2LNu1gyaM/nxqn8Q
 fYLLYLeaHDsZ7SC82J3mnVmwLW1Q5OjipB7rJ79Uq4HUTieDG7QBI4M8ytk+uYEcQO1QixGxE01
 xcX8CNagjt2z7FgacGRl5X3xUo2BIREqsEtK6PrMcFPJaev5DCrO7R56ijZ4t9+SdnXz28AesWn
 yg4eYhVSZ+I3gkOLfkg==
X-Proofpoint-GUID: pLzt7U39oiW2_0dsBrQp9QQmoyk_WdQ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220247

The set_deadline callback is currently skipped if the fence has already
been signaled. This prevents GPU drivers from performing power
management adjustments when the deadline hint arrives after fence
completion.

In triple-buffered rendering, a staged frame may be completed well
ahead of the vblank deadline. When a display driver delivers the
deadline hint, the fence has already been signaled and the callback is
silently dropped. This leaves the GPU driver unable to evaluate the
headroom between the fence signal time and the vblank deadline, and
therefore unable to reduce GPU frequency when the target headroom is
exceeded.

Remove the dma_fence_is_signaled() guard from dma_fence_set_deadline()
so that the callback is invoked unconditionally when ops->set_deadline
is present. Implementations of set_deadline must already tolerate
concurrent and repeated calls; handling a post-signal invocation
requires no additional locking. The fence signaler can compare the fence
signal time against the supplied deadline to determine whether frequency
scaling is warranted.

Signed-off-by: Jeffrey Boody <jeffrey.boody@oss.qualcomm.com>
---
Signed-off-by: Jeff Boody <jeffrey.boody@oss.qualcomm.com>
---
 drivers/dma-buf/dma-fence.c     | 22 ++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_fence.c |  3 +++
 include/linux/dma-fence.h       | 11 ++++++++++-
 3 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index bd58688b81a7..ebc7c5ca6f69 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -999,8 +999,19 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
  * Multiple deadlines may be set on a given fence, even in parallel.  See the
  * documentation for &dma_fence_ops.set_deadline.
  *
+ * The deadline hint may also be delivered *after* the fence has already been
+ * signaled.  This is intentional and supports the case where a fence signaler
+ * aware of a periodic deadline (e.g. vblank) and the fence's signal time can
+ * evaluate the headroom between the two.  In triple-buffered rendering, for
+ * example, a staged frame that is completed well ahead of the vblank deadline
+ * represents excess headroom; delivering the deadline hint post-signal allows
+ * the fence signaler to consider reducing frequency for subsequent workloads,
+ * rather than holding an unnecessarily high frequency.  Implementations
+ * of &dma_fence_ops.set_deadline must therefore tolerate invocation on
+ * already-signaled fences.
+ *
  * The deadline hint is just that, a hint.  The driver that created the fence
- * may react by increasing frequency, making different scheduling choices, etc.
+ * may react by changing frequency, making different scheduling choices, etc.
  * Or doing nothing at all.
  */
 
@@ -1016,6 +1027,13 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
  * to aid in power management decisions, such as boosting GPU frequency
  * if a periodic vblank deadline is approaching but the fence is not
  * yet signaled..
+ *
+ * This function may also be called after the fence has already been
+ * signaled.  In that case the fence signaler can compare the fence's signal
+ * time against the deadline to determine the available headroom.  If the
+ * fence was signaled significantly ahead of the deadline, the fence
+ * signaler may choose to reduce frequency for subsequent workloads to
+ * avoid unnecessarily high power consumption.
  */
 void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
 {
@@ -1023,7 +1041,7 @@ void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
 
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
-	if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
+	if (ops && ops->set_deadline)
 		ops->set_deadline(fence, deadline);
 	rcu_read_unlock();
 }
diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
index 3dca8e09c192..3c5de96d4092 100644
--- a/drivers/gpu/drm/msm/msm_fence.c
+++ b/drivers/gpu/drm/msm/msm_fence.c
@@ -136,6 +136,9 @@ static void msm_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
 	unsigned long flags;
 	ktime_t now;
 
+	if (dma_fence_is_signaled(fence))
+		return;
+
 	spin_lock_irqsave(&fctx->spinlock, flags);
 	now = ktime_get();
 
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index ffa99b930843..839ef2e5dad9 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -264,7 +264,16 @@ struct dma_fence_ops {
 	 * an upcoming deadline, such as vblank, by which point the waiter
 	 * would prefer the fence to be signaled by.  This is intended to
 	 * give feedback to the fence signaler to aid in power management
-	 * decisions, such as boosting GPU frequency.
+	 * decisions, such as boosting GPU frequency if the deadline has
+	 * not yet been met, or reducing GPU frequency if the fence was
+	 * signaled significantly ahead of the deadline.
+	 *
+	 * This callback may be invoked even after the fence has been
+	 * signaled.  In this case, the signaler may use the deadline and
+	 * the fence's signal time to evaluate whether the GPU frequency
+	 * should be adjusted for future workloads.  Implementations must
+	 * therefore be prepared to handle calls on already-signaled fences
+	 * without error.
 	 *
 	 * This is called without &dma_fence.lock held, it can be called
 	 * multiple times and from any context.  Locking is up to the callee

---
base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
change-id: 20260917-dma-fence-set-deadline-a778746e9abd

Best regards,
--  
Jeff Boody <jeffrey.boody@oss.qualcomm.com>

