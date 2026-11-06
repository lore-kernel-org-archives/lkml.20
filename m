Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969256;
	b=eGskjDdXycDT/OkUg8jGOvGqQ2QWJBEKU6Y+3QBjxoTmPEnXCKotwmf0PIlGQTc8qq9N
	 BdOWV4Tu1WrcVfZBCpVbfSYbwHGKVwoFts5yzUICRG2R77x6fkxTiOa0AVCeyuazAlkA0
	 juZ3h7xqJoRexNt3svQcNk+CQPBPM+NWMBVTue0OydvWkEXLqoQcEMtzpzfjKVAPSrZdg
	 Qb7ydQ/9IpEeXO4ZuTTsHWO5/GM2BrlgQ3gmFSpdUBdEsJWB3ZPy1RkoGIM8Db7ruEkda
	 OzKXgVK/Q+IWByYLm/lJWYRjOMlK74f9UMnUtgvDmQJ1H180QcgK64jOhZTX+Sj9GmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Jbz4ViRXJQJmGQTHmz/n4fB3e11Y7YXX3ix7TPBKr/Q=;
	b=ORoGTkJLf3p0yaxy+FeeKiyj7xIchhz/AdsAMA9iwy+I18/1dtmOx4/HQvmJbfYQV1MM
	 mCiZHqR8RRrhdsw0Nt4pP4acNockFQKkJXlMC2w44WjlQfhK5WWCsm772SLVe/U8tohE8
	 +L9kV7VkTJ591m+SvtON1jARsMOPcQMKDxcMsSMzLknnxjNfHdpgspYcz4xlPhgTMHIlo
	 N54+Dt15Gd1pcmseBcBXALoWyauAPriV9TDW4FD5ShaDBx7jgONKxotWU3RLKqAC2io+I
	 HmV5hqHKxqWsE1Hst6p4pJ0/XP/dUvP89uwkMCZHFrSMVbHje+zfk0xiR3jELROVmUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYE8JxpC;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35682606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35682606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYE8JxpC
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f2f262b19so353396eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793969254; x=1794574054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jbz4ViRXJQJmGQTHmz/n4fB3e11Y7YXX3ix7TPBKr/Q=;
        b=GYE8JxpC/XsGkeI4sBpOQ6DJvE77JIlVnRsWlvafhf3pFfJET9MlXd8nPF2d5DgUP+
         30WS2GXdlDp5aokJ22hMIPfJsRLfyGU0uIcm0w+YRP3oBnt0PJjqL0VfCVv6cMUmRwdc
         1cnijDYPjmej/v5Qh8w8xNAlXKNpPqzt0UALSXJ2Wij/wThr1iZrHgNX2RsIv6YvstCf
         65nNWEzTdciPyY6MSNg6KVCUPq/yYaxwVJrQ3Twvabjqwr7fcYH0ABw6WLAInNcndsbv
         lGmqZIkfUzo/vmfc90H6TitpSeBrfZGWZ0O+q+qM7jL8CdR5Sf6dX3kw+KbaUpskv2MQ
         wnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793969254; x=1794574054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jbz4ViRXJQJmGQTHmz/n4fB3e11Y7YXX3ix7TPBKr/Q=;
        b=NbdMcFQXIOPgyns64ZpFqagsZtPHOdPU1hcOe5ad7fIf80xTLW9yJigdFokj3Ss6IK
         oUy8oYYsh4xhz2I9Absxwh2iarpovPrVeJGMf5sVrKcS71oq8+jtFuZu2WrnK8Rfkewt
         R8xz8HZjDgM7bCTYQ+/XOptI9gK7kFGNXdgXZ9cSioeRvnLfw0wDBr8UuqWSYPwlFc8O
         TAfdCxLNROtigVB5WJm4rVe/JNaUFJIQCogTya8KT2+LV8S9YVr9K9XvklCtUwzD/fql
         V59GgzTLNnLyFuE5krrz+VOcnwj5EgE1NJs1bndXCLssx7H6WLaj5euEgaCxUpVsttsV
         /6Tg==
X-Forwarded-Encrypted: i=1; AL+hErGt7JVOIDsyMNIx7HUO2H1WrkskGTirT7KYAlP+kti0U/c7ndCVnAvnq5bHUmP+lXbbK0ytLJzlre8Bt+c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9N0PLTpVO2yn9c9EbvXU6LGE9H18YuHFzTNFlxJRb1lldQyQAY
	tEZ89BUOMXXuAewksBDQ8rIfMKJ9ieucRRbP2A00UNbuOcT+AOkPtmS4
X-Gm-Gg: AYBFou3UjR1Oi1+hAmdfcx3pJd0LterdHxbn1m8Abw/9LUcVVjuURopWFm4I8YaXqKM
	XimLYm+zrfne5r8oXmuXMrkDl1kMeR0i7wlG+zsYneLkUmICjhm10ykfAq1Z9+slJY/tBa7LNmH
	d7557TsazTrUkix/utU/BxGcebdJYtDsunc7eKQlxnx3CnpIUHt5lr2GbTtVYL4SmXwZ8PX01XM
	M9Ya2s8nKWyG1zGU92FpzS5ZxsIuOEu/5U9K8au5IlvT61b8ul69l06HaocGYTg4bdxFB3BIf2o
	BZX25FcbTJR/tGF/jqcJHlWaI/xGy5BvHiz8ZPBi3PMA+IvgBB3UI9ArmUH5erZ4jepxmrHr3hf
	ns3I51F3riSXJbfb0N1DrENK4eXncJzTBsnbMKGakPuUSILnRgtbFnMwlfPHOzsdLB0099Nr84F
	8mAthfBVhzMz8AjWGv2nocP/wyI89g1l+sSfTuVcUQPSmrU3FxCipHTuFnsGKaUzusGlyAazzK1
	kgWIMneyoMFKWTUX9o93Ox8CzeBc+YMaaKFGandotYAODz6zX4A57AjowP/DDDNls6MZU3YPiqo
	TGpxiLHSLivYCoZOibDjLeW7SZoIt1gXMGkUxylpIN/tGeLg1nlToVaXVOmQD/bJJYM2VzB0UVc
	JE+U7/c+hUsTFlwkOfyT7R1xYGax90Ckk07PuKg==
X-Received: by 2002:a05:7300:ea18:b0:36a:12c4:8bdd with SMTP id 5a478bee46e88-36f7554337amr3612023eec.21.1793969254337;
        Fri, 06 Nov 2026 04:47:34 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa30138fesm6844272eec.0.2026.11.06.04.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:47:33 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: davem@davemloft.net
Cc: edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	n05ec@lzu.edu.cn,
	ylong030@ucr.edu,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org,
	dennylin0707@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH net] vlan: prevent cross-netns MII register writes
Date: Fri,  6 Nov 2026 12:46:39 +0000
Message-ID: <20261106124639.12584-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

vlan_dev_ioctl() forwards SIOCSMIIREG to the underlying real
device without checking whether the VLAN device and real device
belong to the same network namespace.

A VLAN device can be moved into another network namespace while
its real device remains in the host namespace. This allows a
process with the required privileges in the VLAN device's
namespace to modify PHY registers on the host's real device.

Reject SIOCSMIIREG when the two devices belong to different
network namespaces. Preserve MII reads across namespaces and
allow MII writes when both devices belong to the same namespace.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 net/8021q/vlan_dev.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/8021q/vlan_dev.c b/net/8021q/vlan_dev.c
index bca0a3693636..0d0904103302 100644
--- a/net/8021q/vlan_dev.c
+++ b/net/8021q/vlan_dev.c
@@ -416,9 +416,12 @@ static int vlan_dev_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
 	ifrr.ifr_ifru = ifr->ifr_ifru;
 
 	switch (cmd) {
+	case SIOCSMIIREG:
+		if (!net_eq(dev_net(dev), dev_net(real_dev)))
+			break;
+		fallthrough;
 	case SIOCGMIIPHY:
 	case SIOCGMIIREG:
-	case SIOCSMIIREG:
 		err = dev_eth_ioctl(real_dev, &ifrr, cmd);
 		break;
 	}
-- 
2.43.0

