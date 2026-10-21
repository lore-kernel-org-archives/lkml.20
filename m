Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601008;
	b=LadL2M60ZVYjCyCo7xtjHcUu18mDBtzlfjSDhrUJ8XtCPPT8f+b4BspLxuor5sfURh8r
	 ZW3oU6KG9kqYAhT5akBeqRWI7YF3A0ga3UQ+tQE8Q9rl2a6gHoUzL24tBLECdBCcHoP9P
	 umVCQ0KIXcXXnelVDkGpS629nuG8Ot2jvh3PhYVcl3iAzI7sktCvTPJV3yt4DQcS94hyK
	 euOHz+/hHHY3x+DHBoej9TA45w7x3A3L9tORt64os0LQoZCWqJ6xMNZLElESCgy6hFNEJ
	 uYZchDmEmb4RRZfJHixGPUJKMjPUMPg9FZCKjNUK7RQrjciU2FhH/tjS4uU/P/JjHqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=Ci8HQ01z2l/V3dvB0tBYdp+UGZOKQC242kExtdOTHs4=;
	b=b/pZcJ56b4Jd7qZnujFyMkW5pJ1B8YQ6fqK4T64c07lKQ9uNL+BB//kkMZ1yMa9rMx7W
	 2XdrEQKU8O4Ve9zNbnz77c6llSTvjBG5cjC1RskVS5B1I954nGX7wFRSxdYPNSoXrJ42x
	 aNZRb4Z/OtWX86AV4Uh2UJcIViRIORhr/H5j/5Mie21+7eCZtRyWQVEBqH48ZsNdFthlt
	 p78KVf0OjIz7YfG+CAbxwQa4nqkGaueBsvBx6GW16ODCr/McCs/m+3BoY546/MZetpJbW
	 nuFeJSqi8CbHtm1vXAvIzA7E1LgwJQkYHu/GqjyGYhFw4Thxe3Y5Hcv4RE95PiuvlXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DnvLvDTt;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A5A606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00A5A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DnvLvDTt
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso5002975ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792601007; x=1793205807; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ci8HQ01z2l/V3dvB0tBYdp+UGZOKQC242kExtdOTHs4=;
        b=DnvLvDTtBy7cN7BNYpcCz9JwEHLw0xK8wVqv0zpzZSxW0EFrjl62Crt3/vzVL67jRw
         +wIovjXsjSRwuf+RAp5bOOnSWaPFGEEqtjEHnLW7DhmC05SYGcVROA8DULZb9lHCaZU9
         d0VgzExH93c7j0iXT4XTJWDqEpC9orlkwgzJr5CHgp0hspFkWv2c99CWEdBT0rMAD9yG
         pAFp7XHazWLDFc/uGPRsJpIBKCUUrUn8OzSrC+ozjQSbfCH1LqX2n8b3IJ+I/DTTKfRO
         kOPEu0+o+mA8gzC5wqpZNfh/5XV4F1c9g3u0guJPTTjuytALZVDeiRiUNJAyNScenoYq
         M4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601007; x=1793205807;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ci8HQ01z2l/V3dvB0tBYdp+UGZOKQC242kExtdOTHs4=;
        b=WHDpUVzMBQ1/zR4jwg96AhkUEG6BeZVGiu59Cm/w68NBW/fyZwJMoeoQMaIAXO5i4L
         mCqofIbm9XjXF4pIcpQqDut3tpztlWXEZT5AYoUCj14z4qTR5ovzxrCG2vM+/CofQ+CI
         Ws1MJTXEmHkc3zVE0r0PEcKN9DDA1WT4UC5t0iQlIR/KueP+SYCVL5hCREkg4mFhcAAo
         cc/p+YwbmljALNEg00ku0zqf5pwZSAajr920E6Q9DICHioVNcLx4Ebjg99UMQFIT0Iqf
         AeekRyeSaxu1DFi+e1OG8fQMcyWhXCYJWkkVfZRadNFaiBE3XorPoHNqlxZERHcPzKPu
         FDzg==
X-Forwarded-Encrypted: i=1; AKwUvBynJQvYqM8rsCkNgFEaUXW+zCPh4j2yHrcCzcXI9z2Pz1v/SAJBe25QdCgeqPCzRcgLQNa8X34Ir2RN1Yo=@vger.kernel.org
X-Gm-Message-State: AFq9FYImIgGoLNNV7sbehO79Bc2nVBlTmHiZ2U1BiUvbOOCH3KF9HhQz
	mBtvEiCv63aDH/joNqPC284glhlLB5qw4zZmOIms8T7pO2wVO2HZiwoa
X-Gm-Gg: AYBFou3PNxJEOF9zFF4mWWaogs4m0AT4UQiMMFNaZGdrkz3wUyI8qdkZPCCRmfF43cW
	VQ+fyJj5VWC9b5tlCXCP5j9/xiyCUIudzf5PZC/JbuBUz0mNpfKzRf3r1oD/O3tTr5QDQerL0Yi
	iln1cH2rU3yZJPKRK8fNyOe5BLb4scqpBmDuNvYKBGKILbu0d8og6l3kkEQbge0/LAuEpG1Oups
	JX7GqF+7iwYMAiz8O7xgop57S4tbLm9rfqNKPVHzD7JjvwjneLJJC7q8t2H044Dljgl6pVkMVmi
	yu9RLc9xE801c2Q95oovspJAzb4QP/Dnhq85gnKvnuMR4ss4krvLxcPrT7+Qh4vfN22Yj99/Hv9
	js4+QWFDfP/Cudzb3rmBPZN/Bgxf4hryqXhSpER1w3YRkcZK4sbURPogPYOnJAInsZTdbB7UT2N
	IMY/wH9Jco4FYwRcDxOWdGGDfnz404GhnhicXn1YArzLgONm+hvpAa+STEKIQSRO5cYIVQSlKqH
	3i/EKP08HTjkGJYattBprI7l/pKcwONdLdM6F8pkqTguq3JSYsTmZXkbf86JfdkrIrWCncIKfwz
	nvGSGOnSWhgT1OneQdOa0Zd3LSC/l3uuHHBu7sWHG6BkvvWhAvM0qk5yJCotMQ==
X-Received: by 2002:a17:90b:514d:b0:3a8:699f:959d with SMTP id 98e67ed59e1d1-3ad86d55b29mr2259973a91.31.1792601007016;
        Wed, 21 Oct 2026 09:43:27 -0700 (PDT)
Received: from localhost ([153.61.198.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6b84b513csm257161a12.12.2026.10.21.09.43.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:43:26 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 16:43:25 +0000
Message-Id: <DMAO0T9BL4YQ.2B3YU3ON26N6L@gmail.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "John Fastabend"
 <john.fastabend@gmail.com>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Jesper Dangaard
 Brouer" <hawk@kernel.org>, "Stanislav Fomichev" <sdf@fomichev.me>,
 "Kuniyuki Iwashima" <kuniyu@google.com>, "Hangbin Liu"
 <liuhangbin@gmail.com>, "Martin Karsten" <mkarsten@uwaterloo.ca>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>
Subject: Re: [PATCH bpf-next] bpf: Pass extack to bpf_xdp_link_attach
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Leon Hwang" <leon.hwang@linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <20261021152455.71524-1-leon.hwang@linux.dev>
References: <20261021152455.71524-1-leon.hwang@linux.dev>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, Oct 21, 2026 at 08:24 AM Leon Hwang <leon.hwang@linux.dev> wrote:
>  	case BPF_PROG_TYPE_XDP:
> -		ret = bpf_xdp_link_attach(attr, prog, log);
> +{
> +		struct netlink_ext_ack extack = {};
> +
> +		ret = bpf_xdp_link_attach(attr, prog, &extack);
> +		if (extack._msg)
> +			bpf_log(log, "%s\n", extack._msg);
>  		break;
> +}

CI is right. This looks odd,
but instead of CI's suggestion:
        case BPF_PROG_TYPE_XDP: {
                struct netlink_ext_ack extack = {};

do something like below:

sock_map, netkit and nf links will probably need the same when you
get to them. They can take &extack too.

diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
index 1d34ece..5926f13 100644
--- a/include/linux/bpf_verifier.h
+++ b/include/linux/bpf_verifier.h
@@ -1269,13 +1269,8 @@ __printf(2, 0) void bpf_verifier_vlog(struct bpf_verifier_log *log,
 				      const char *fmt, va_list args);
 __printf(2, 3) void bpf_verifier_log_write(struct bpf_verifier_env *env,
 					   const char *fmt, ...);
-#ifdef CONFIG_BPF_SYSCALL
 __printf(2, 3) void bpf_log(struct bpf_verifier_log *log,
 			    const char *fmt, ...);
-#else
-__printf(2, 3) static inline void bpf_log(struct bpf_verifier_log *log,
-					  const char *fmt, ...) {}
-#endif
 int bpf_vlog_init(struct bpf_verifier_log *log, u32 log_level,
 		  char __user *log_buf, u32 log_size);
 void bpf_vlog_reset(struct bpf_verifier_log *log, u64 new_pos);
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 4548b0f..f5d6438 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -4418,7 +4418,7 @@ struct sk_buff *dev_hard_start_xmit(struct sk_buff *skb, struct net_device *dev,
 				    struct netdev_queue *txq, int *ret);

 int bpf_xdp_link_attach(const union bpf_attr *attr, struct bpf_prog *prog,
-			struct bpf_verifier_log *log);
+			struct netlink_ext_ack *extack);
 u8 dev_xdp_prog_count(struct net_device *dev);
 int netif_xdp_propagate(struct net_device *dev, struct netdev_bpf *bpf);
 int dev_xdp_propagate(struct net_device *dev, struct netdev_bpf *bpf);
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 87cd122..0ce75ee 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -5865,6 +5865,7 @@ err_put:
 static int link_create(union bpf_attr *attr, bpfptr_t uattr, struct bpf_common_attr *attr_common,
 		       bpfptr_t uattr_common, u32 size_common)
 {
+	struct netlink_ext_ack extack = {};
 	struct bpf_verifier_log *log;
 	struct bpf_log_attr attr_log;
 	struct bpf_prog *prog;
@@ -5944,7 +5945,7 @@ static int link_create(union bpf_attr *attr, bpfptr_t uattr, struct bpf_common_a
 		break;
 #ifdef CONFIG_NET
 	case BPF_PROG_TYPE_XDP:
-		ret = bpf_xdp_link_attach(attr, prog, log);
+		ret = bpf_xdp_link_attach(attr, prog, &extack);
 		break;
 	case BPF_PROG_TYPE_SCHED_CLS:
 		if (attr->link_create.attach_type == BPF_TCX_INGRESS ||
@@ -5978,8 +5979,11 @@ static int link_create(union bpf_attr *attr, bpfptr_t uattr, struct bpf_common_a

 out:
 	if (ret < 0) {
-		int err = bpf_log_attr_finalize(&attr_log, log);
+		int err;

+		if (extack._msg)
+			bpf_log(log, "%s\n", extack._msg);
+		err = bpf_log_attr_finalize(&attr_log, log);
 		ret = err ? err : ret;
 		if (prog)
 			bpf_prog_put(prog);
diff --git a/net/core/dev.c b/net/core/dev.c
index a142613..d79a589 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -97,7 +97,6 @@
 #include <linux/kthread.h>
 #include <linux/bpf.h>
 #include <linux/bpf_trace.h>
-#include <linux/bpf_verifier.h>
 #include <net/net_namespace.h>
 #include <net/sock.h>
 #include <net/busy_poll.h>
@@ -10773,11 +10772,10 @@ static const struct bpf_link_ops bpf_xdp_link_lops = {
 };

 int bpf_xdp_link_attach(const union bpf_attr *attr, struct bpf_prog *prog,
-			struct bpf_verifier_log *log)
+			struct netlink_ext_ack *extack)
 {
 	struct net *net = current->nsproxy->net_ns;
 	struct bpf_link_primer link_primer;
-	struct netlink_ext_ack extack = {};
 	struct bpf_xdp_link *link;
 	struct net_device *dev;
 	int err, fd;
@@ -10786,7 +10784,7 @@ int bpf_xdp_link_attach(const union bpf_attr *attr, struct bpf_prog *prog,
 	dev = dev_get_by_index(net, attr->link_create.target_ifindex);
 	if (!dev) {
 		rtnl_unlock();
-		bpf_log(log, "Invalid target_ifindex.\n");
+		NL_SET_ERR_MSG(extack, "Invalid target_ifindex.");
 		return -EINVAL;
 	}

@@ -10808,15 +10806,13 @@ int bpf_xdp_link_attach(const union bpf_attr *attr, struct bpf_prog *prog,
 	}

 	netdev_lock_ops(dev);
-	err = dev_xdp_attach_link(dev, &extack, link);
+	err = dev_xdp_attach_link(dev, extack, link);
 	netdev_unlock_ops(dev);
 	rtnl_unlock();

 	if (err) {
 		link->dev = NULL;
 		bpf_link_cleanup(&link_primer);
-		if (extack._msg)
-			bpf_log(log, "%s\n", extack._msg);
 		goto out_put_dev;
 	}


pw-bot: cr
