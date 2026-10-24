Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792883227;
	b=t8TSdNQOjfd6eNJ2LFXBaRznUbNHHrE230T0nN5FZkWj1NmNFYrRKA6JE41KMUsnLTOJ
	 hTkWBbeDDOy5VYFp5qFqrKsSHfzw5wrybvWDAA4jUrfwCEyLVM5x874iPRyQDySe3U+zX
	 ksJBhyGgx3qj8EyjBOKo2qeeFzKdKkh/saFHmq+6T7PbFDWIodf5UZ07gOnmM1YrVFzep
	 VBm+B/yiIJtvo8b8Ut5I/l38bqvyXdZ8iHPlbtj5XNgsSBZjSZbpQlHc9b3ocbGa2LJwN
	 HnpOmok6PoXDwuCxwva9NppeUjcRowsceE46jFWEnZXnXbaJpRh2WtCLLYrIAgBqrQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792883227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ilKVSD9FJbr4rCgUq3aZ7XRBwC0roP+y+YvlkpAT2Pw=;
	b=ife+VLuP7RsR/yQFOWiZtiV9dVfAANrbg+SE9WmNH758YPLBRMPY0iiBiZVoi8U/xvO6
	 iFYv04iaFhFTGk1ycMAss/jn07e/xNi+5XHUICTNmgAhIDAB4HCRUaILpS5e0B6HQJ8Qk
	 GeUkKq2H1L0YntBrMxcWktpJxI1IJKhAC7zc5u6/IYBUR/zz9eBuP6CheQBfLmw5KgSAG
	 6semZqklyIr1r+SYmynFyB1O9SWkXjse2KXZozb0mXmvD4PukWBdLqCvC8wmXMCsFYl7B
	 48OnE0fOmwCZ7HuImU2A4NAMbKYhe1E15zILmPS59V0jLS7QMkjAH73FVSQIhi+3dfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N9WzVPxB;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E3D606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 23:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2E3D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N9WzVPxB
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c247f6687dcso289511666b.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792883225; x=1793488025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilKVSD9FJbr4rCgUq3aZ7XRBwC0roP+y+YvlkpAT2Pw=;
        b=N9WzVPxBXctumTp0wOXBruzh3pYlSuW0il9yspz22fQ8bBM7aLv/Kv50Oss6qBHO4c
         pXD6s9Y6qS362JkZKTQTIc0Of6sF0AW5/JQPYcTs3L4YjuRLmKvUZT2st1Urfw+IhpFl
         giRZPBIIJMHe8RLvryIZjSijssm5f4jV3B7PWhus2f4d5g6MEoMBE1IGkv5BmUE+xktJ
         agPprLd4htxF+mcGgIO16dagm3kR/8FXNaQS7Oc0bCCvqUjrS42z8Kr31LCWF54NES+U
         SaDVP5udDmBlbZ7ofE9sy3gIZ2rlRfN1Ao/t4+BTC5CtreVqbPD0kNCIzbUNaDvRKV2g
         9nhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792883225; x=1793488025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ilKVSD9FJbr4rCgUq3aZ7XRBwC0roP+y+YvlkpAT2Pw=;
        b=L93Ul1NqA5s8ymYrk7KHghinBKVmmBZLlXiWmBJbhHhIEBI7fIN7FbkCGss4UghkhK
         y865CW3j44VzKGvPDStXeA7DCB5oCEa7kqeUZfmPPQforsas00ylOV4MONMcdafRutYF
         JcrBP6DyzThaD/ls7usz45jfd7DOUIF2tZquKtDJwV6EIIInJLJQHpBqKe/IK2NRsHTV
         3UUdWCHB3XxcprdlGvJ5LojMP0xTc4AO50qTg2N6Eirzofqc8o71oCfOdwUZTDDM1Z5e
         nQaOsM1h3gDaXj3IWnSQnn2l+GrVp0v67hmj9m9H+FKH0KtEFg2eX0jnuNjvg3XXUz8t
         8bqA==
X-Gm-Message-State: AFq9FYKBAXFBZakyNOZ3ZfjbmvQLIuxz1VKgLsCHh6a7mG4lQqQD0nHp
	f/9VGNzMi+W3OL6avQ2dVJSYLYnU8kK1bd0759Aw2PGcxeRFTM29gq3a
X-Gm-Gg: AYBFou23+KShaI294CE3DRqTYL2PBu1erEMcgk79GIMYXRaUgt8OW9qEJKG/zQHaQke
	Om48/oVRSH02VGG4iw3c2fSYCngAQSvWiZQK91H7CjdbvkT3n4JwMrdN4IDUb7ONzm05+SKviP3
	QFWXTdCXSVNCRDoU+gBvTrcBoKbrD4vaBbdour7znvkKVSVZQ0hi449HgKS1CZR4RL5XOu3RV/x
	htykjN2Ocvr8T+wY22OQK+gdsHjV9aaV3IoDNGUG3Uj2kT3azb/uYkzR6LlPxkwDKNmx/4WKjMX
	kuV0mOb1ExY52IjAJuPplGSnr4Ji+tvPCrhBtovXP+eSUkFvIJAwkf+0PpVytqCTAq368Jq7R5f
	+fJ/5deqRXhYRBpMMUXew+3Tb0Q0t9sA1L/GqZB8coBx4teaW15HDnODCHpVRpj57dkmZRwCarK
	RFvkOZGi/JVJSY9ykq6o9IaZ5fUE0edRSv6+pmKFhrgq0mc2xwZpzJa0p9dVJpILQ3K/7VPe1kq
	U2mMDlATXa8CfIU6T3SeQfwBFe4vkK3iLKoNrp1OdCVCOnwE+ba8mnS
X-Received: by 2002:a17:907:2d21:b0:c3f:dce3:20d5 with SMTP id a640c23a62f3a-c46bdc10b94mr344242866b.22.1792883224932;
        Sat, 24 Oct 2026 16:07:04 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:49::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66fa1asm136868366b.62.2026.10.24.16.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 16:07:04 -0700 (PDT)
From: Sam Crossley <samuelcrossley@gmail.com>
Date: Sat, 24 Oct 2026 16:06:04 -0700
Subject: [PATCH RFC 2/2] netconsole: add configfs trigger to replay printk
 buffer
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
Message-Id: <20261024-netcons-replay-upstream-v1-2-9613f38496e5@gmail.com>
References: <20261024-netcons-replay-upstream-v1-0-9613f38496e5@gmail.com>
In-Reply-To: <20261024-netcons-replay-upstream-v1-0-9613f38496e5@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Paolo Abeni <pabeni@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, Sam Crossley <samuelcrossley@gmail.com>
X-Mailer: b4 0.16-dev

Netconsole only forwards records while an enabled target and its transport
are available, so enabling a target after startup, or recovering from an
outage, leaves a gap in the remote log.

Add a write-only replay attribute at /sys/kernel/config/netconsole.
Writing 1 rewinds the basic and extended netconsole consoles to the oldest
retained record and queues the records for transmission. Other registered
consoles are unaffected. Records keep their original printk timestamp and,
in extended format, their sequence number, so a receiver can deduplicate
what it already had.

Replay is best effort and asynchronous.

Note that "replay" is now an attribute in the netconsole configfs
directory, so it can no longer be used as a target name.

Signed-off-by: Sam Crossley <samuelcrossley@gmail.com>
---
 Documentation/networking/netconsole.rst | 14 +++++++++++++-
 drivers/net/netconsole.c                | 25 +++++++++++++++++++++++++
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/networking/netconsole.rst b/Documentation/networking/netconsole.rst
index 4ab5d7b05cf10..2e489dd64ba42 100644
--- a/Documentation/networking/netconsole.rst
+++ b/Documentation/networking/netconsole.rst
@@ -111,7 +111,8 @@ netconsole module (or kernel, if netconsole is built-in).
 Some examples follow (where configfs is mounted at the /sys/kernel/config
 mountpoint).
 
-To add a remote logging target (target names can be arbitrary)::
+To add a remote logging target (target names can be arbitrary, except
+"replay", which is used by the attribute below)::
 
  cd /sys/kernel/config/netconsole/
  mkdir target1
@@ -125,6 +126,17 @@ To remove a target::
 
  rmdir /sys/kernel/config/netconsole/othertarget/
 
+To replay the records retained in the kernel printk ring buffer to the enabled
+netconsole targets::
+
+ echo 1 > /sys/kernel/config/netconsole/replay
+
+As during normal operation, records above the current console loglevel are not
+sent.  The replay is best effort and asynchronous: the write returns once the
+consoles have been rewound, before the records have been transmitted, and a
+console whose lock cannot be acquired is skipped.  Only netconsole output is
+replayed; other registered consoles are unaffected.
+
 The interface exposes these parameters of a netconsole target to userspace:
 
 	=============== =================================       ============
diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index b358e5c367351..f527a5ee45662 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -1830,8 +1830,33 @@ static const struct configfs_group_operations netconsole_subsys_group_ops = {
 	.drop_item	= drop_netconsole_target,
 };
 
+static ssize_t replay_store(struct config_item *item, const char *buf,
+			    size_t count)
+{
+	bool replay;
+	int ret;
+
+	ret = kstrtobool(buf, &replay);
+	if (ret)
+		return ret;
+	if (!replay)
+		return -EINVAL;
+
+	console_try_replay(&netconsole);
+	console_try_replay(&netconsole_ext);
+
+	return count;
+}
+CONFIGFS_ATTR_WO(, replay);
+
+static struct configfs_attribute *netconsole_subsys_attrs[] = {
+	&attr_replay,
+	NULL,
+};
+
 static const struct config_item_type netconsole_subsys_type = {
 	.ct_group_ops	= &netconsole_subsys_group_ops,
+	.ct_attrs	= netconsole_subsys_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 

-- 
2.53.0-Meta

