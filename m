Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF0246A61C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766582; cv=none; b=XAi4O+YKEZNkSml5+gTZHGTn5ZCm27L2R+w3z9K896eWISGxtdhvIZOpp7QHg/iTcenqw9k8JE4NMiWoqt9cMOzxIuw86QdGQKx7futuYAUZxNAMBxSUVkIOJr1/K3wdeaTMgofsxURBYP8Ba4TAr9vkLBxitgOKQ00kkewoMFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766582; c=relaxed/simple;
	bh=8o8c4IAe8U75qnpSJQagYzi56CmZ3s7yR+zEHSeQMv4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s5QrqkTgs9SEk9mu0JjW5YItnpweHOoi2YsWo45DzN3YsL7g5MMOcMQkWLvFty2zWrrYRim7WgCJj5L+Zudg+XqGQEU8F9glP65OCFW4my5A7TfpHbk+6Xb2Y6QkEVSwq6e7WqnYfxvlzIz4m4waDQb+lacbsGQz6SXrqnJSd+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1H9l2hJ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1H9l2hJ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38f620399a0so793729a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766574; x=1788371374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8o8c4IAe8U75qnpSJQagYzi56CmZ3s7yR+zEHSeQMv4=;
        b=C1H9l2hJBtw4weAQ/oKw+cjQHWqeQsUlUAow8SQpk84X54abaaybOUQinHu7eqHUFJ
         mCUfB4yEfT3dZ6hqIp4k31CWDdFiz61mVLYUeGlKXHNEXD4bvRuCfcyDdZTbOCMwmKUg
         dhe152XPxRUB8dRlZ4JAQ4m7FheCqTxqpezXuYhl2y7I7kMtCsupOEqRIZAEpl35GLlH
         SslYZWnE0LdEYfOJCwpB6TWSUstJKZq9kDnFXaXVlsfvYi2xCaUkcSQ5Rj+MqUnNXFwg
         B4xk/0/sO3CSAtlyEiCYIuQpNMr3W9AH9LoPMxTFZBn5eAADeProfvRM6z3RmwtzoWR7
         5uHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766574; x=1788371374;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8o8c4IAe8U75qnpSJQagYzi56CmZ3s7yR+zEHSeQMv4=;
        b=TRjgvDA70Id07QZjxhz+CPjKhlTQndsEXmEQ9KIwIcEobqCpeBrUE3eFsL9M96wtUN
         OYUeHLaoBs3rSfB4vVMXG9bu5p1iHe77K6Rjmd8PKiPQX8GP0UzvC1RxF6LHMDUfn81M
         m7k6fh16mAzKd5Ely1BAcmkFc0MgVtzrjZCTH72Au6TxqPfMBgfycu8rUMTRKTU+YSlO
         5u87pj71EvOuh5tOuu6LRPwzbHaFcfJpf5DvAJEz+OYYvdQ58wOOubSBmCf3JEyVgouS
         esW194RRxgtMUFf46B3USFpO98K9XoApf6m95sGlomIyvY8rBUi2uoQ+iN/otzVzpYV4
         iRxg==
X-Forwarded-Encrypted: i=1; AHgh+RqPAFI0b86P1fIJ0lXbWZ4MOcZFWNtB4Z2sO4yCAbTZ8XOuOh5RRC2MAR4Kivh2QNhaF02Oe3GdYqhxmu4=@vger.kernel.org
X-Gm-Message-State: AFuF++nYaLBMZ/t6xz5oYi29SVYrrfsIIST1ngP8n5NC6VtsZBh+0mZ9
	dd9xtMl7jIde04UA7+xFjafPFXrNWgK4lnccdlbZ+fU22CSFraNQjE0u
X-Gm-Gg: AR+sD105FZijO0sc5SxxFH3JoCVz1YudD9jDqr27Vwm7u43mku0QGO3P8BQOnd8vE08
	K6c2Pv5K9uYG1bOHpU6aQG065G/1v9EyswxcKGfk+GgAbS2DVx8UxBpot9PVXpWkikeYpw2QlPx
	vTJLyFmbFFLcToBcOkbgFRII70utv0bgEPuzntXgHxC0EZaLWisYPp10uxBHRwyjEPSEQydohvi
	sk3qNgACEGcBdzGVjJL+c0Fypc1wv84lMnr85G1Tcyskz92wJzPfIMWoCfeLntIEPq5Z7mFH6lB
	a5jTSo0lE/DYuG12/YsZUM8K+54AFuAk7+EAkaZ7Vy+2xUrCRr+7uKWf330MQX6Aj62v6eqg73L
	9dV7jPaM4NQGqd9RfnbRpZdx/iGD2NjW+cUfGND1UmXDlCFb9p133O5DWRz79STUjPBFJZCcTmg
	0rffFGlQXIVQRDeBj+n23fmlDEMwpMOn3mNPSRwxFgteH4j1OzHIMdUs2id6ojraXxd+U74lMs/
	cgqTz1C/YEJvHYFvrugpIE=
X-Received: by 2002:a17:90b:280a:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-3966d1e226bmr18902135a91.4.1787766573836;
        Wed, 26 Aug 2026 10:49:33 -0700 (PDT)
Received: from localhost.localdomain ([103.210.91.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3966875e5c3sm5093511a91.7.2026.08.26.10.49.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 10:49:33 -0700 (PDT)
From: Khawar Ahemad <ahemadkhawar123@gmail.com>
To: bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	magnus.karlsson@intel.com,
	maciej.fijalkowski@intel.com,
	sdf@fomichev.me,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com,
	horms@kernel.org,
	syzbot+aa48b5fe7bfda62d1682@syzkaller.appspotmail.com
Subject: Re: [PATCH bpf-next v3] xsk: Fix circular locking dependency between &net->xdp.lock, &xs->mutex, and netdev_lock_ops
Date: Wed, 26 Aug 2026 23:19:25 +0530
Message-ID: <20260826174925.3425-1-ahemadkhawar123@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260826173019.2917-1-ahemadkhawar123@gmail.com>
References: <20260826173019.2917-1-ahemadkhawar123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

I sincerely apologize for the noise and mailing list churn. You are completely
right—I made a mistake in rebasing against v2 rather than upstream master,
and I should have respected the mandatory 24-hour waiting window.

I will pause here, stop sending revisions, and ensure future submissions
strictly adhere to the 24-hour rule after thorough local validation.

Thank you for the correction, and apologies again for the inconvenience.

Best regards,
Khawar
