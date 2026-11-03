Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699696;
	b=RD/L7T96O9Q6c4nAX40CBdtf6DJZJpMU907W21RWckog4umlkUNj+NrI7LO4Qvhacgl8
	 e8JF9I38CByoFWxezlOg1fPznEv5i1P/rQ35DUEG9UFl3QEzYXnybthv5BSeurBAKLAAF
	 Ry8Zw+8lsug+SmDcZSZnJ8kzJaYiIVx7+P2yhLb0hQE3Kp9A1yPEBWixWaG4eAmI//sS3
	 YfxYuWf7hfhoKwoKfcVYDm+qEvZTG9xVZpGQuXrwNHAvDbVNUGuOo/qF077G6TOHwoxjw
	 cyz9nVRPowqHJlaKTZpAf6JX6Qb4my8gzlgJlN/I/MZBSn8vzWn3s8c39k8u8TO5kqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699696;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=7O3qK6NQZiMzw6jt5TU0sGJN/nyeWM0XPpYnj5iMF0A=;
	b=ZCsgr3BzSqOreB22lxfHesbo7jO3GvWJyAjd02K6BhAXvH+mTgs1QLcZgsuNUFoF3MpO
	 RdrPAYhI5dgtcnCmt1uLtO1gFqtB/xotTBqqr1CtSOVlIjfMQ5oh3xZQexzCkon4W5+Po
	 OVJ203UzmtMRbcq85r09svb3C3ZruUSKsnbjTjRHkE9avNSt+B+buHwNI2e37P1AH4vU7
	 54VdO1hEUpXHIS2vsTRd2pnPrZ0fwub02+J2KRFZKqrkZlOW4bhVM0qy+H/QO551EZ3Y7
	 LLLuxEnDOae5rt74KLMTD4Jej9A5mG+RM3xZXCFfSs3bENs3ixfVEe7Yu8y4hYrUKQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="g+C8K/jo";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D6D606EEBD;
	Tue,  3 Nov 2026 09:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g+C8K/jo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 929B71F000C1;
	Tue,  3 Nov 2026 09:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793699695;
	bh=7O3qK6NQZiMzw6jt5TU0sGJN/nyeWM0XPpYnj5iMF0A=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=g+C8K/jomsZefw1qcVsmBeaODrK+U3vuhGwdWYqNycpGmzXhpngBmIfn9QIDh7IWi
	 x8HX2TfBKL4FjvZJUqYLwYvvOHp4kU2ikHnNIyHoj33RtLWqnyWpmo2wrZr3fZMOpx
	 qB59s6Ln8ayr5PL9RfqDJmqTM4hSW6/jYdulM6rvhdqr1XdJePdR6njuorM501eL30
	 sPdEbsQqhQc0uzCRo2AgVeEeDT2fYD3p6lJ2XbJo6eCkrAqbYO0v7NMYkjmC+pR5Zk
	 zu5J7D0O3/z3B4uUM/AA4ilzIQFe0627vWBCB0tJNu3ESoUJkCQ+Dg19cSD+QXR7zT
	 Lh2BfR0xSreIA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/10] soundwire: bus: Hold bus_lock when looking up slave devices
Date: Tue,  3 Nov 2026 09:53:45 +0000
Message-ID: <20261103095445.81414-2-lee@kernel.org>
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

sdw_get_slave() iterates over bus->slaves and requires bus->bus_lock to
be held by the caller.  However, sdw_handle_slave_status() and
sdw_clear_slave_status() drop bus->bus_lock immediately before calling
sdw_get_slave().  If a concurrent slave teardown unlinks the node via
list_del_init() and frees the slave while bus->bus_lock is dropped,
sdw_get_slave() can spin forever on the self-referential list entry or
dereference freed memory.

Keep bus->bus_lock held across the sdw_get_slave() lookup in
sdw_handle_slave_status() and sdw_clear_slave_status().

Closes: https://sashiko.dev/#/bug/linux-b0e65a93-dfd4-4e3d-a96c-8f13ba0aafd2
Signed-off-by: Lee Jones <lee@kernel.org>
---

v1 => v2: Drop Fixes and Stable tags

 drivers/soundwire/bus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index aeaae5a57c89..15c66effbf4f 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1907,9 +1907,9 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 			mutex_unlock(&bus->bus_lock);
 			continue;
 		}
-		mutex_unlock(&bus->bus_lock);
 
 		slave = sdw_get_slave(bus, i);
+		mutex_unlock(&bus->bus_lock);
 		if (!slave)
 			continue;
 
@@ -1954,9 +1954,9 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 			mutex_unlock(&bus->bus_lock);
 			continue;
 		}
-		mutex_unlock(&bus->bus_lock);
 
 		slave = sdw_get_slave(bus, i);
+		mutex_unlock(&bus->bus_lock);
 		if (!slave)
 			continue;
 
@@ -2052,9 +2052,9 @@ void sdw_clear_slave_status(struct sdw_bus *bus, u32 request)
 			mutex_unlock(&bus->bus_lock);
 			continue;
 		}
-		mutex_unlock(&bus->bus_lock);
 
 		slave = sdw_get_slave(bus, i);
+		mutex_unlock(&bus->bus_lock);
 		if (!slave)
 			continue;
 
-- 
2.56.0.385.gac671c819a-goog

