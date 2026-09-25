Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47314E8DFB
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790365363; cv=none; b=TLby3Wpsa0lUIF3YlGL6H1YIVUxK/xwoUi3pPuZDX68F+6ZC7Tms5gANNpKC8kqtgsHqBrLV3v1kfPyXgQA/oeZuZKaeovLIoG+pq+C6uyb27JHaBgSiavV+wn9sw1X0gIB8QqLeD9xaWce2M8ONoO5YEuOWLR+F2AY3c+8U3qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790365363; c=relaxed/simple;
	bh=1VWZYciLHbgddZTdHE/3XXjdoTgU8Dsut3G+9HXnAdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fm3gZrQITIqjd/rDbBoIrskKz2JBapRTqGXE16t6FA+TazDDgvo6E/dvnwDLKkmeaGRIcJfESNBvCRiu1yT5gr+9RFTAg2TXEYdK1BO4pKONOEeX1IJCzWpb6ZsJd5m7lbf01td2o1X65/Q871eH2KXiNb5sosMvOpEEfd5la0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2AJXEJs; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2AJXEJs"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so6497575e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790365358; x=1790970158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y01LBiaH2IwpyL6MELf0OxRYiwawGfhA1ZMvZPY+wcQ=;
        b=a2AJXEJsI5MILmvdYBs0fj6UFC46kJXV8LAU7KYp8UAJvwTwshqbr9I9roNEcrLpiH
         WwYVxH1K9eu66s7kq5DcfrU2LkVZsR9fuCOQGAgDS3YZ7Kc0Dek6gfvN8mBA9Fn4A0CE
         SjkyIpqIY3cgTXcJ6oNQLLhP3DQaDLT2UVP7llRM4MqaNkKBhJvVGbN9jg+VDHdR3Kfu
         FsX3U8MvkO1m9vMp8Pvjisw1bqSpHuUzWfqG7JcpXvp0rNWmhg3bVrnFtUOTFOdPhv4G
         WtOIuLYL0EHEiGWOwwbTTvVkYRQmV67H7I/C6ttwbpaaLeyLiAUGMu/1//7322e9a77P
         SgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790365358; x=1790970158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y01LBiaH2IwpyL6MELf0OxRYiwawGfhA1ZMvZPY+wcQ=;
        b=QOW6XGuuUEZkhlKpLGX1SSEPJ/XRx4Vmw1VWdOBxnlTavBhaESoUxhtKM9ECO31RFi
         1ZK6qUcmF5hWAtZAfouzzszrBTvjVbXyqRHktE09f9HCcRtwgTnwnp0CGPuFQvrk+2lV
         jdaQsM+cGmQE1AC78WAYPNAbeGrznxGszZIeut+aAqmEyBYBam+K1KbPGYt1T0bJHLyK
         aEn6mvmUH+nh9w/ydjWnFOHztolyVcoWPs0+UOq0E4c7YzbTLUH9cyLrmNbLGXHQmcxd
         +mhc5CuqcosGjLT2KSJ5iwCqMQcRD1ueFiZX18k+B6RLev6ArmOD2iKnINZPNtG8q/o3
         oWkw==
X-Forwarded-Encrypted: i=1; AKwUvBwWpVf2wLwv88MpRS4+5t7strdu8QAL6bk8svaKGBPPKSTpiUaCj2a07j9H65l4IoY86UVfRAeXazTWGCw=@vger.kernel.org
X-Gm-Message-State: AFuF++nwV1AbpsaChKoKkN8WzWPIMhRGrhJEEhMMY7tOA4IB4zwBqeRm
	B8YkR0GU8JFBJBl+HNHHajG0bwMKmhwkie4Kj0raDCVBhXCHJKtkFcHX
X-Gm-Gg: AYBFou27uia8iLo3QtN+kkC02DOdSrGFLWyZkzlVuS/5+0XK+uf+UthWDRvHQwUSaMD
	iSpYmIQURPzqY3FTryxo7wMgBVBq6uj88uXElQt1kRLMoWDnrk0naZnGUZUi7vlw4EbcgTl6Bh0
	sB41aHG715n6M46El0/pjdno2FGdbG/vUefol1xJNzZKpRb8851GI8CKaU/30kwc7JqcNcgt5K7
	mGjOffYIKAOuJG7DFyND9b3fUXSVYE0pDF3QdC8z9argOsB56/rpVsSsAdQxZam/yYYmpHl2dkU
	JsWFCKR0Sx8O8YzeDm00TvfBx1p9lyGEo4lLhdA9JsHWQYrJ54F1X8KrxZ8Of9kVNErwkQjHpTS
	Ol4ilGvevDtRF9scHRHkZ+PBmiXjlTrxqpYFiAG8hrP3xBrTa1QunuL0uTDG4dSqu54qxx88CpJ
	y4TfO3//F5Anl71hArToww57kNJcz8ureK4SSjKcFlTsuMsI7pgi2zHWjKpu0L9rRY4hFIUMUIo
	rkh5g6KqDV44PuQgUfzq+sh6wmNqVjNAiPJ2b2lRnE/IA8rvUxZaA==
X-Received: by 2002:a05:600c:1548:b0:49d:257c:a735 with SMTP id 5b1f17b1804b1-49fe66f164bmr120031085e9.11.1790365357978;
        Fri, 25 Sep 2026 12:42:37 -0700 (PDT)
Received: from cachyos-x8664 (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5de187asm168549765e9.7.2026.09.25.12.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:42:37 -0700 (PDT)
From: German Pablo Lindo <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: bard.liao@intel.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	zlzzm2014@outlook.com
Subject: Test for [PATCH v4] soundwire: dmi-quirks: drop the ghost RT1320 on the Surface Pro 11 (Intel)
Date: Fri, 25 Sep 2026 21:42:36 +0200
Message-ID: <20260925194236.9651-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913210849.6446-1-lsa.uz@pm.me>
References: <20260913210849.6446-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Surface Pro 11 with intel lunar lake series suffers form audio problems caused by ghost peripherals, using this patch solves the problem and makes usable not only the speakers, but also the microphone.

The cuality is not the same as in windows, but is good enough for casual use

The Patch seems it has gotten stuck/forgotten, hope this test brings back on track the patch

   Tested-by: German Pablo Lindo <germanpapulindez@gmail.com>
