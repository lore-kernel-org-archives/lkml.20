Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792739017;
	b=JgqDHMskvsX6QscTpMhjFpxQLA+oD+Lg1xfNyyCMJTz9CEs44jV9Co0FXXGaNe52JsxO
	 k/tEqfPL8oTToT9s/apJFC2yUSOFmnP9hkI9TBI0uERUm/hVsmuf8aBqlxMwfHmFIFQVz
	 aJIJlw3y5HRT1N48G2dZdxU7BpGauy4ZMy0ULvrbIEnIvNRlsos2IbAII/8cviTku+OWh
	 QZQQ/kn5sddMsjy+5tJZ5hr6uS5eeZm47NCMhGbLTGiSdID/eXWRhwt2rbaaVCb6JJlZV
	 k0yahq92NffRv8mLdDUxtso7QeMs8bwoQE1NZwyz7RY6LA7zbSiFsLTvxAvGAGCDfcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792739017;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=75R9zmnE1BoYKXTA7IKrCfrOxlvJnACSHeuJYN46sWk=;
	b=uIeXeJKCruR4UTTvTYRb3J027BVsJrN41o9IPP0V9QP2V6ycjFJADvoZqB8FKiahLmhT
	 NBDJ+LUcfiv+0o+LJ+VPNkNuFQc9rdKqaiVVOFeV8RoEPlr6qdHE+rOBY+v/ds48wozt8
	 46MCUtnzCDN7U8/+pZJU4DaJF+Enf/X20w95niJwnQWfIiCNWsX4a9sAH+ZpJiQC7Ezkz
	 myGGaXb0FsFSE6x4cMfFn5vQqlLXG1HzKsvIxOmepcRnwW0IYxvMccH21rz3tpiSrxA/F
	 q435C8b/+xvl4qDqy4eeL8Hpqn1yXNVlnEJ4dKYM48J1hFO8etAUNjmdo6Wkta9fVOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zfp9wWOF;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9229A60A380A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9229A60A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zfp9wWOF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792739015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=75R9zmnE1BoYKXTA7IKrCfrOxlvJnACSHeuJYN46sWk=;
	b=Zfp9wWOF7B7mdjlPbQNvKltZukbdtK2viCu2GE4Byw7c0yodgj075cGEPGLrG1P92g4WTI
	+1wQOpSYKkuSmCyHJRGUSOIWmgvY/ZBk4uSa4KDT7o0wvuPuYIeMDLwHhaU8en+JvhlOq8
	UqrPwxxkAj3hGYvgJxXsRgwslPjyj/Y=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-207-p1kmpOMoPIuDWuYvxLby-g-1; Fri,
 23 Oct 2026 03:03:33 -0400
X-MC-Unique: p1kmpOMoPIuDWuYvxLby-g-1
X-Mimecast-MFC-AGG-ID: p1kmpOMoPIuDWuYvxLby-g_1792739011
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 627291800624;
	Fri, 23 Oct 2026 07:03:31 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.32.22])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CA9331800347;
	Fri, 23 Oct 2026 07:03:25 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: netdev@vger.kernel.org
Cc: Petr Oros <poros@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Mateusz Palczewski <mateusz.palczewski@intel.com>,
	Leon Romanovsky <leon@kernel.org>,
	Rafal Rogalski <rafalx.rogalski@intel.com>,
	Shiraz Saleem <shiraz.saleem@intel.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	intel-wired-lan@lists.osuosl.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH iwl-net v2 4/5] ice: do not block on the aux device lock in ethtool set_channels
Date: Fri, 23 Oct 2026 09:02:56 +0200
Message-ID: <20261023070258.730168-5-poros@redhat.com>
In-Reply-To: <20261023070258.730168-1-poros@redhat.com>
References: <20261023070258.730168-1-poros@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

ice_set_channels() takes the auxiliary device lock to test whether the
RDMA driver is bound, and ethtool ops run with the RTNL lock held. This
is the same inversion against the RDMA auxiliary probe as the one fixed
in ice_send_event_to_aux(), reached through a different caller.

Use device_trylock() and report the device as busy when it fails. The
existing diagnostic is not reused, a contended lock does not mean the
RDMA driver is bound. It is a netdev_dbg(), the condition is transient
and userspace already learns about it from -EBUSY.

Fixes: a6a0974aae42 ("ice: Prevent set_channel from changing queues while RDMA active")
Signed-off-by: Petr Oros <poros@redhat.com>
---
v2:
- rebased on the new patches 1 and 2, the trylock now sits inside the
  pointer test done under adev_mutex

v1: https://lore.kernel.org/all/20261019065301.3983537-3-poros@redhat.com/
---
 drivers/net/ethernet/intel/ice/ice_ethtool.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_ethtool.c b/drivers/net/ethernet/intel/ice/ice_ethtool.c
index 5482a64c81c95a..dbc662d6233957 100644
--- a/drivers/net/ethernet/intel/ice/ice_ethtool.c
+++ b/drivers/net/ethernet/intel/ice/ice_ethtool.c
@@ -3947,7 +3947,11 @@ static int ice_set_channels(struct net_device *dev, struct ethtool_channels *ch)
 		mutex_lock(&pf->adev_mutex);
 		adev = pf->cdev_info->adev;
 		if (adev) {
-			device_lock(&adev->dev);
+			if (!device_trylock(&adev->dev)) {
+				mutex_unlock(&pf->adev_mutex);
+				netdev_dbg(dev, "RDMA auxiliary device is busy, try again\n");
+				return -EBUSY;
+			}
 			locked = true;
 			if (adev->dev.driver) {
 				netdev_err(dev, "Cannot change channels when RDMA is active\n");
-- 
2.56.0

