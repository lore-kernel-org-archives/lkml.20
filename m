Received: from mail-dy2-f40.google.com (mail-dy2-f40.google.com [74.125.229.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C6547F3B6
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 18:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790879034; cv=none; b=qlL2QgYN+IWSyJVoRnJevz/ttzmSnbuy4IN+ElmaqMUiLTB8fSv7h0eT0zreD5TbAUpqS//imqIB9lxpJZqGpZmuCg8zG9eFEjAVFJQ03b3WH3Es21RaxzpQH7RaZUb4sQxTDEz4iqPHLNVK3h1ntWpERnx5q3AdSBsYyqpyRK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790879034; c=relaxed/simple;
	bh=ApPsSddcz34krnPCoImgDAAUnXelxvxjJ/VafXgbhUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z82srZxKb0wJkfZuOtofWclAwi0MNIzTc7uywbHu5DTBEhclMjPpLjG4j8lJvkuGojCM39Scg3Y7T9wYwVPQVPZAc0QyvKkt3y2vinReFzmo+uNgp+j5lISxZncznziac0N3GW52Y10yeSv5C4g/AOymdcdkSQdEbTKBx19gOsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oR4nYzGe; arc=none smtp.client-ip=74.125.229.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oR4nYzGe"
Received: by mail-dy2-f40.google.com with SMTP id 5a478bee46e88-34ea9118159so759982eec.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 11:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790879023; x=1791483823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNFa4jlYFw2EffEHYX+/aDUCOKTNBmwQOlvs+e8ofc8=;
        b=oR4nYzGeEMBrRreVr/WDdjuzM80CdQf/jbOJiKZ/2R2qeqzHMkCbHxtSsgVunzwRxg
         zCmUvglH8A1yYe35tkVy2qdc+gp+UeixqgnmK+sxgBaDxV09/WEnwseV+8o2yASxT3gX
         0Jn0t+J9o84y45Ratk9RpwquvWkDDZq30IvdY1Rhpl8GMdL1HSP0X0iXrUR6wODRHHkO
         aFr8kFYAyFQD3vE97LMTabS6BhMdYCv1teGZFysMPIBQuSM1iz2AL39F0Dgfo3zDNVC3
         oQ2beHX0H7SoR5sPZ2qNCUYNk0pwPITrVYFL7qRgbxa3n1zabatzl7HrsgJk1h1uXAam
         +ERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790879023; x=1791483823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNFa4jlYFw2EffEHYX+/aDUCOKTNBmwQOlvs+e8ofc8=;
        b=Ort5g69shc+CMRj6bEW2s9gJtxfjhbVEd+Uj4Sbe9E504DiZS2mX9QGAoBto002tV/
         3cpAyBUOS5TlRneOcokPRx6y0FraPy6I/CFeeuz+s1wJ7OjLRwAjKcarGj0sJC6On+j3
         19nEG75wyuZovrxi/Ssy5JIkWRyvaNdOzA4el+XPRO1Dt8VxRaQKJ/SbHuh1J98CjRW7
         EEZ9EQiMrWqPu6OS2dFrhVzrBx8Zgmhq9LUZ+qSWQweMcwTxYI+bS+jTjJtng34lPKIe
         gSYJf44W84lATFBpBWFqn6AcAT2hozt2+Qlos3TpHlO0YLWSDzSCzJPy5kCxAlW/pDON
         FZEA==
X-Forwarded-Encrypted: i=1; AKwUvBwQbgvfKNShYwzdTFLBfO1V94eSLraJ803fDIr1mxjn1WkgzTyJYQVtLIWOAH/rfyNDsx5JExfmaUBMURo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFW6X1ePKXdoKYiomGd8+p2zP8CEryMCMEjcNt9I3Mx2kY9t5M
	yaRrrMc7gyyLjWhSYAV7pesBUHJNEVumSzZObwIV9cb0c5lEe+50rZjS
X-Gm-Gg: AYBFou2fug9dNV3bGYLLqkWrzfDu0XhKYp48lSRbyd81Vcgm40sy7SF0nisV1Sz1N9l
	eSZBoKyL6yHRi9p7CYeKDp5fQDtNVvOb8ssGPJuJigGAeMqqnrSRY0jxSduSipCw1IiREQYUwvN
	dP8Ghni3Owf/5CXE/SUZxR+zXIHgzhlMsZtP/9/hlP+4mRHJFXZrAvCUiYE0zJdEnq5I+4aGSGW
	YCXrXN5bkAk8aQxfuha69/xqveL7ZLlLAsS0YGGbD6UXUDkwhwW1G6tNNV8K/zEYVNk5oZtaRve
	LJdpGSYaMjRMHStOEnFdMF6ZbHezh0kcF0iyth2F2uzKuTTlV5rEBWTDuQPdrTv9ek10B5oHp7A
	DEHZLk9E7oav4htQRsYDmFtlae1GzES/e7FFUkOFOqGd6Jd8J5wxku0vyC26pyIGDExuMScUvu5
	dXi9ncsSnQa3gI7cbszaqnBJJO8cqB4qINM31nD7eIqfSmUZLDhQvV+phAaImoUi/tCkhAHxfnb
	GOwYrF4ZcCWgR1bVQcW8cs1EzzeCqDaQQ==
X-Received: by 2002:a05:693c:3881:b0:34c:1f07:2d5 with SMTP id 5a478bee46e88-34f1508567fmr105771eec.6.1790879022862;
        Thu, 01 Oct 2026 11:23:42 -0700 (PDT)
Received: from 192.168.50.3 ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f303e3sm189671eec.5.2026.10.01.11.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 11:23:42 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Jiri Pirko <jiri@resnulli.us>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+2cf741c3005abc20@bugs.sh,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 2/2] net: team: free skb when broadcast has no txable port
Date: Fri,  2 Oct 2026 02:23:26 +0800
Message-ID: <20261001182326.572045-3-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001182326.572045-1-bestswngs@gmail.com>
References: <20260926090039.1714460-1-bestswngs@gmail.com>
 <20261001182326.572045-1-bestswngs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bc_transmit() sends the original skb through the last txable port.
When no port is txable, it returns false without consuming the skb, but
team_xmit() still returns NETDEV_TX_OK. AF_PACKET sends then retain the
skb and its socket write-memory charge.

A TX-enabled, link-down port keeps the broadcast transmit op installed.
Carrier can stay up through a second link-up, TX-disabled port or be
forced on by userspace. Free the original skb on the no-port path while
leaving the existing drop accounting intact.

Cc: stable@vger.kernel.org
Fixes: 5fc889911a99 ("team: add broadcast mode")
Assisted-by: LLM
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 drivers/net/team/team_mode_broadcast.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/team/team_mode_broadcast.c b/drivers/net/team/team_mode_broadcast.c
index 61d7d79f0c363..69dc25a5847a1 100644
--- a/drivers/net/team/team_mode_broadcast.c
+++ b/drivers/net/team/team_mode_broadcast.c
@@ -37,6 +37,8 @@ static bool bc_transmit(struct team *team, struct sk_buff *skb)
 		ret = !team_dev_queue_xmit(team, last, skb);
 		if (!sum_ret)
 			sum_ret = ret;
+	} else {
+		dev_kfree_skb_any(skb);
 	}
 	return sum_ret;
 }
-- 
2.55.0

