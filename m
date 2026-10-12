Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6782747A873
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798921; cv=none; b=YKNmzRQ1R9VeNM7RK4BTn9o9LUV93zDQfmg+/hMSeI2ZZGokRXkhXFu6i1zLmbrCl2kPHTRLgd3VUJQ7n1z//iZ0VayS/hDPEYcIQf0noO2Xu62YclmB4PM4RxksRH38ZlQs0V5kvYvBxD12yFmjAZxoyf90V/yYhAifxfU+GBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798921; c=relaxed/simple;
	bh=ARn259GPopKaQ1nz80eSAsTTBgPnnvNnnQsFuBBTrVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X0ZVECGUcpjuMeXqBWfx//DPrrUtzAQdxOOWMGyLwh61bL8QmsnuWAcGx5Jz4B5D7Ui/ymjQezeJk3jXjzsDjkngbW6N2SPYRdlvmcn07R/UfXdudMDYgNKCCYP+FmHFTFhNeIQyDP/SUIonfTINuAOAWEL0YSNMzDEfU5JfSOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=N5p/Z+jn; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="N5p/Z+jn"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1617008f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791798912; x=1792403712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0CM5VfsqOao7iGtSvqmBNpy0L/RVrXCLn8weNJqgTC4=;
        b=N5p/Z+jn7o58pAAUKfKnEQgrV6Af09QVVRF1tv9/R0n0N+P9ywatrp8jSY8UqdnRV6
         CjCXD8ZnWiyK+3LcuyMb2OGn3fCMuCjijeWojZK7wgbt9n7cGEHszkcoSfhMQO9iNChu
         9/ejjevxQ739ofrj+v0S5JfndTavuoWD2g3RPiCAipt7m21DAOBZZcfVEli0/53kb8mt
         OFe2DKAEYBEqSp268EReC/DzFLnQV7ZKwUqHMdAI8xFeC2BHU5F2SAonTAfmfZ8xp158
         owZZ8k/rqBbStYzx/CDVTD7jpB4LqivZA2T3bSOG0n67+vLNZaJsmWLoa09x4rzaoSvW
         kmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798912; x=1792403712;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0CM5VfsqOao7iGtSvqmBNpy0L/RVrXCLn8weNJqgTC4=;
        b=l1aJXxMRU9aNOd3YKnynEKGgkS5LcsLJCAit+9kvmTdG/3FglC30Blo/QctjI5UhCl
         OHYu+F+eJFy2q/tuqNfJEPi8lWsdWZakHaL1KjRkit2O3DY8SjebDOro+8/AB6sKSq6w
         VxtEUHelqjDiC92PHq3e3C+5Gmlc2N1J4WtLlcSpBzOggDOtLNXIKwV9dquBb+Bbas0G
         E1LZOpvEP5ShkmrkiMWgWGCHeWb7b2I6XZAbn0Exw47u+Zy7fTpQkc1TWEz+goZ0F8t6
         SemK9fquLwZcK64N9KvmF7MLDuYsJSmWb1520IWutdxQ/egZnaJHT6Rk5OkdF4uX90kg
         K/hw==
X-Gm-Message-State: AFq9FYKw4bVYH0orC/ApWpWgvmpiA9xs9ANuzTlzWw9qoQaC5RhgF0Xp
	j0TQ31AiYLSwdzeqIQ75gdEwfRCdFAIY90XtYnqP+5MOEf0c/tIh1iW0nkhwGiG4Gvajc0VW2F6
	Ge2m9oHI=
X-Gm-Gg: AYBFou3dcL43bT9TrqFUq4ctZUHmUP7gILLsF7xG3iMf9HUhNrTArQRG3VG1Co6HLDi
	W1W3OpPPZBzyyqF0rcxtmDeAegfHgPMSMdCzNUMa4TWmWqGvZmKJVz4a/lWAjv6KMOZRlizcuJ2
	n+7N1gJhWm4v82uBSX+vci5Xz78cR56oj1vEQQ/hzxsOuPuxtaLu7ArPNysJ13fIVxeW7rTU3o+
	jLRIhg9ybAZBZ3UFvL7h++v1xnT+UXCMT9cI/F3q4S1jaf0Wl0jQHFYShxitupAxUxZkPqS8DFP
	B0bacWE+2jmkvS3aN9oW6dioY4OxIk1FnEjGvwwMtPfqKUJpumndiNkdxhrGra78oGuQf1t4Mzs
	ETqXUel8k2bJPXHqJUQfO7iO8cyG+wy/Z/FXpIc0OICgSglunM0fv8bGfUdV+uLKXBjFsEmC8v+
	EtTfVH38Afii+KAosKn3Ss7NfWb9j0bZ4UhcVgKjTkUrtfPwopmeJH8g3GTlzqQhbjc+IaNiHKW
	Y7NdDygV9qmUknZd25s6vMDFckhxsNHFQ==
X-Received: by 2002:a05:6000:24c8:b0:48d:bb54:779d with SMTP id ffacd0b85a97d-48dbb547a7amr16282034f8f.9.1791798911237;
        Mon, 12 Oct 2026 02:55:11 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db98c2800sm18539103f8f.26.2026.10.12.02.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:55:10 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Subject: [PATCH net-next v4 4/6] net: thunderbolt: Move long delayed work on system_dfl_long_wq
Date: Mon, 12 Oct 2026 11:54:43 +0200
Message-ID: <20261012095452.135828-5-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012095452.135828-1-marco.crivellari@suse.com>
References: <20261012095452.135828-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently the code enqueue work items using {queue|mod}_delayed_work(),
using system_long_wq. This workqueue should be used when long works are
expected and it is a per-cpu workqueue.

The function(s) end up calling __queue_delayed_work(), which set a global
timer that could fire anywhere, enqueuing the work where the timer fired.

Unbound works could benefit from scheduler task placement, to optimize
performance and power consumption. Long work shouldn't stick to a single
CPU.

Recently, a new unbound workqueue specific for long running work has
been added:

    c116737e972e ("workqueue: Add system_dfl_long_wq for long unbound works")

Since the workqueue work doesn't rely on per-cpu variables, there is no
obvious reason that justify the use of a per-cpu workqueue. So change
system_long_wq with system_dfl_long_wq so that the work may benefit from
scheduler task placement.

Cc: Mika Westerberg <westeri@kernel.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
Acked-by: Mika Westerberg <westeri@kernel.org>
---
 drivers/net/thunderbolt/main.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/thunderbolt/main.c b/drivers/net/thunderbolt/main.c
index d9fb587a62c5..59a4dcf719b8 100644
--- a/drivers/net/thunderbolt/main.c
+++ b/drivers/net/thunderbolt/main.c
@@ -316,7 +316,7 @@ static void start_login(struct tbnet *net)
 	net->login_received = false;
 	mutex_unlock(&net->connection_lock);
 
-	queue_delayed_work(system_long_wq, &net->login_work,
+	queue_delayed_work(system_dfl_long_wq, &net->login_work,
 			   msecs_to_jiffies(1000));
 }
 
@@ -470,7 +470,7 @@ static int tbnet_handle_packet(const void *buf, size_t size, void *data)
 			if (net->login_retries >= TBNET_LOGIN_RETRIES ||
 			    !net->login_sent) {
 				net->login_retries = 0;
-				queue_delayed_work(system_long_wq,
+				queue_delayed_work(system_dfl_long_wq,
 						   &net->login_work, 0);
 			}
 			mutex_unlock(&net->connection_lock);
@@ -722,7 +722,8 @@ static void tbnet_login_work(struct work_struct *work)
 		netdev_dbg(net->dev, "sending login request failed, ret=%d\n",
 			   ret);
 		if (net->login_retries++ < TBNET_LOGIN_RETRIES) {
-			queue_delayed_work(system_long_wq, &net->login_work,
+			queue_delayed_work(system_dfl_long_wq,
+					   &net->login_work,
 					   delay);
 		} else {
 			netdev_info(net->dev, "ThunderboltIP login timed out\n");
-- 
2.55.0

