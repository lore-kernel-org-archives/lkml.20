Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.16.66.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342663;
	b=KxnT8+kk8eT6xC314CWn2LvGC0vmn8Jp+ILEFmoa9PgAsvJ0svNxoCPqT+WIHZTjT9sv
	 qjgvymF/1Jhy0N71jpwLrWjnyTePNS6TsJdm4FNBWd/JUy/DA8PXOccO/g+AcNGDxK/Ja
	 XzvyvmX9P2sli4gMsjwlbD/3jBy7EEjqM+1BsNrt9TdxpzzyKe03S0kEHbtFBPoSnXsGF
	 DsoSP7BpzSbY/7Du76ku84FwI8SVXxyUa6piccfranqDX7mT3F8zidhc43KftK5ZLG0Z+
	 zWXZ8OhXSpw+KKFzyxRNOuvnd17uH72IoU1xJbL9339PQcVZyyzazJjsmQL18jZMwlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342663;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=nb6Y3qBz5md8bEdKSYVr1uCQAxRH1CiYfiJZ2O+ozgw=;
	b=sR7N3hqJ7Z2fqKGu6qojuqXgh10a/JYxB10hGD2X/+mvS8Ro+wAHkxHWliPDZtLzl+OC
	 Ts85/bh7CWBQ4f7mXRvJLPdBUYbJVLg+YFtQT64j3xz9bM0Vw8Bedkb3D/3NUtNg/Orgc
	 c3xvLb7ijCVglMWLjJaoTKXB8HGz2XtLrqzqEyqiBH1/PKJT00t4jMKmxOZnjJ05DE/2z
	 5stU5HzWgBfka1jK4RWRsIhCsWy0b81mKo6xTMRZKoL7AvoCJLHTdJpllidoe1aq0mPOj
	 jtmz7IcCq8Y5R9Ie/yy1T80zw7GT8TxV+sEIFyQHjUxuWazjSx5hfTn3Dv0zSsvAtrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=digikod.net;
	spf=pass smtp.mailfrom=digikod.net;
	dkim=pass header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=RkLx8uZi;
	arc=none smtp.remote-ip=84.16.66.173
Received: from smtp-42ad.mail.infomaniak.ch (smtp-42ad.mail.infomaniak.ch [84.16.66.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A5460A2612
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15A5460A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=RkLx8uZi
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jPJFX0MH0zGl7;
	Tue, 10 Nov 2026 21:30:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1794342654;
	bh=nb6Y3qBz5md8bEdKSYVr1uCQAxRH1CiYfiJZ2O+ozgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RkLx8uZieNxXzrjKg5Q7RvMY/4DP2HAAxxCnTZDhFsvsTTZiQQatSu2cd8I1dmptx
	 vvFATq3PBHrmTiqJ+8Y1ZhSQfM+bECDi0QV2v3TKRYvRLraHNoiRMAAZ1Ffx/VPryk
	 My8PBshjHTHR1ypFM5mB9/WWIUdQeEbbzz6vdUjA=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jPJFV0L4TzwgN;
	Tue, 10 Nov 2026 21:30:54 +0100 (CET)
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: Casey Schaufler <casey@schaufler-ca.com>,
	Georgia Garcia <georgia.garcia@canonical.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	James Morris <jmorris@namei.org>,
	John Johansen <john.johansen@canonical.com>,
	=?UTF-8?q?Ondrej=20Mosn=C3=A1=C4=8Dek?= <omosnacek@gmail.com>,
	Paul Moore <paul@paul-moore.com>,
	Serge Hallyn <serge@hallyn.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Christian Brauner <brauner@kernel.org>,
	KP Singh <kpsingh@kernel.org>,
	Matt Bobrowski <matt@bobrowski.net>,
	apparmor@lists.ubuntu.com,
	bpf@vger.kernel.org,
	kernel-team@cloudflare.com,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org
Subject: [PATCH 5/6] selinux: Use security_capable_lsm() for CAP_MAC_ADMIN checks
Date: Tue, 10 Nov 2026 21:30:39 +0100
Message-ID: <20261110203042.2410140-6-mic@digikod.net>
In-Reply-To: <20261110203042.2410140-1-mic@digikod.net>
References: <20261110203042.2410140-1-mic@digikod.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

has_cap_mac_admin() checks CAP_MAC_ADMIN with cap_capable() and then
with SELinux's own check, so that other stacked LSMs do not have to
authorize it (see commit db59000ab760 ("selinux: only invoke
capabilities and selinux for CAP_MAC_ADMIN checks")).  This also lets a
process in a Landlock domain that denies CAP_MAC_ADMIN get or set
security contexts unknown to the loaded policy.

Switch this check to security_capable_lsm(), as for AppArmor and Smack
in the previous commits.  The cred_has_capability() check is kept.

Cc: Günther Noack <gnoack@google.com>
Cc: Ondrej Mosnáček <omosnacek@gmail.com>
Cc: Paul Moore <paul@paul-moore.com>
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>
Fixes: 97c8386f1d74 ("landlock: Enforce capability restrictions")
Signed-off-by: Mickaël Salaün <mic@digikod.net>
---
 security/selinux/hooks.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 9950f89dfaa2..5d85bc06f4c5 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -3363,7 +3363,8 @@ static bool has_cap_mac_admin(bool audit)
 	const struct cred *cred = current_cred();
 	unsigned int opts = audit ? CAP_OPT_NONE : CAP_OPT_NOAUDIT;
 
-	if (cap_capable(cred, &init_user_ns, CAP_MAC_ADMIN, opts))
+	if (security_capable_lsm(cred, &init_user_ns, CAP_MAC_ADMIN, opts,
+				 LSM_ID_SELINUX))
 		return false;
 	if (cred_has_capability(cred, CAP_MAC_ADMIN, opts, true))
 		return false;
-- 
2.56.0

