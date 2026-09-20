Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995F737BE6A
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 16:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789921066; cv=none; b=iEffKOanrAqAWt+JgFiz3jV2DkAfPtPL9ZhsR1YJWttczdWV+u5yZ6apVi7oKLdjAWnsf5hgPEadIWoJ1RIGk2PU8ZOeNA+TI3nghiNGHbuLsq1UfQ4psFNHBzsLLBpTv4TLkIbNqgwHoXfv+ZsJ3GqlDu8zg71rWreE/Pfzt8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789921066; c=relaxed/simple;
	bh=q3+uLqBCNGSzkE7tv6YmXIvrM+sKuNRFRAZZq6awJKM=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:MIME-Version; b=pMF2TBJ6V7R4uUi5ZLHtHbaOzhUmOgd9V1GYs+erB+3oIvRfcwCpOt5lcmBfxrbqtc9BLEY2QygzFMpH9R1MuURm1MLgzPUgwCy3kExLWPl7Ug8sVvbgPHLxYl5d97H7xe1rI7DouKzBBgcRY6CZtU+UwV7HgqR6M38f6Bg58B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=duKHX4Dt; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="duKHX4Dt"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-868a9c48f9eso2789477b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789921065; x=1790525865; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eDlZ0Axn1IVbcM7wq+/bUYuF1RFbaZNrtATk3Wq6DJU=;
        b=duKHX4Dt8MebFrNKOBbwKA2zHIAc5hYGd4rZx9EIq/TFka+FWnjzmOfANMEadtVZaa
         kz1z3TP7YwkYEGG+UFUA//LL3YuQesxIUkNWyvhnr9MS6c6SMrQfRMBdUHX74hHb2Kbu
         VRbcwEfgS5YO9rD0BTR4oujohJt+MsTbwrY1WYxSPuC//gjd2GN3zUQa+W2bpytcV2bq
         mUv4FIBOMPlg4SkpDrHihSaZdEQlMpdHxo4e+2i4HS0XRv3tDxjEHFCx/M4otdm5ZElU
         zUkjvPY1Z26Zppry1wxFyP2neIN1nfe1jGkQGzPHCEkV5UYRRLO2WHX3gx5iO9Ee6g6X
         InkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789921065; x=1790525865;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eDlZ0Axn1IVbcM7wq+/bUYuF1RFbaZNrtATk3Wq6DJU=;
        b=A/XGBfJdIyhawO5xMjulL/yuG0itQ+47uxXFsu4YacvrjsC4grIBPsePisUpVn4AwA
         LfhH6eu7dvc+fxM9ysoKmx0TCYMYlATcTNj/815FTu5LWYxR8V4JI88ObRLOwuyt2yvf
         MuA8SdVU5gQPMUXujV4GO83UT81//m13MSM4XkSuYb17e2VV7hBjQ9Pw10Qbn9Z/3fAm
         eyXzULEKj63vRGJgUWgarXaqAjknA3FB9N6pXBX9WYLPVP7YJqOZGLZLd/NmUIO7Zord
         S/c+LYmn5vnSQlj5bvLdQ/e4WS3lRJfVRrSvn9nwEh/wG1lmDff5OjrLOpH6Mb1pv4Rc
         np+A==
X-Forwarded-Encrypted: i=1; AKwUvBwbnaPs9NUw5z3z/rsNor6+PsXcQacZDiRo18llXa2wN1N2VhPJRUtPMAue/+Oju/YM5kjgqvnUCpN5uTo=@vger.kernel.org
X-Gm-Message-State: AFuF++mMsjmx3XcrpQj4uSeZT+ovufstyQA6JDwpheN7t3tdHEEGlE1k
	1jRwFk2/mm4fxgvOEUZWe72+hUNNW2zJ9nphmkmzOLwwsuixLKOVuOKv
X-Gm-Gg: AYBFou26rW77MlbNek0A9AfRUm1gvNHruOe+oXlzBJgUI+NVodg1BzQ1y4FijIx8cTU
	7wRzb2czXjRiWbVlFKF8QXc6gnnCc4B3cpPFvYucfu1s10U/kph8dODAh0PZ/W8YzB91PaMXNRJ
	P9XR+BosPf75Xac9pXQdJZ4mC5BMhaitNtQQtYq0oataTbJaoDvP8x3Y7pJb95r6aK8wOqQZCU1
	kR5MpQpDSuLTyOv6GDmikxfLbdSjUvcSSdVHIz8D0VmhI9DA4aZx0YEBL3LXmJ4BFA5ZUHaNIq3
	UE1MDg6a9m+RfUbm+XHLWHi3wueALl+QvdCM8kf6vntQmQYgLKD0FE/8xb4q8cVu0HkJG5MMR2M
	5tmXonX4sFd53AE+uHOMSX0sEgnUrhugy/sqXNl1mQv52d4HNvqjtmzFep0n6mVkQ09Ia0ysDCg
	NyBhOcxBa+m3W1JUD+zBuOUY8qUdeLJ+caR19JarDa53M2XWsT99T/5GhaJVcaoedvtWDTljXd6
	EAAbC0Rl6YzKhQcNSqdeFUa9I+04sG6wOjxuqgExDD7Kf1tOc0Ak7Fzpa1o6uHuW1h5xoxEPSs9
	Eo+l
X-Received: by 2002:a05:6a00:4b01:b0:848:4faa:480b with SMTP id d2e1a72fcca58-874dccf8702mr13211565b3a.12.1789921064613;
        Sun, 20 Sep 2026 09:17:44 -0700 (PDT)
Received: from localhost ([153.61.198.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa6fd3ecsm2107269b3a.59.2026.09.20.09.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 09:17:44 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 20 Sep 2026 16:17:43 +0000
Message-Id: <DLKA28VU4GIV.I4EVTT076Y5Q@gmail.com>
Subject: Re: [PATCH net v1] bpf: cpumap: fix use-after-free of dev_rx on
 netdev unregister
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jiayuan Chen" <jiayuan.chen@linux.dev>, <netdev@vger.kernel.org>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "David S. Miller"
 <davem@davemloft.net>, "Jakub Kicinski" <kuba@kernel.org>, "Jesper Dangaard
 Brouer" <hawk@kernel.org>, "John Fastabend" <john.fastabend@gmail.com>,
 "Stanislav Fomichev" <sdf@fomichev.me>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
In-Reply-To: <20260920133017.248620-1-jiayuan.chen@linux.dev>
References: <20260920133017.248620-1-jiayuan.chen@linux.dev>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, Sep 20, 2026 at 09:30 PM Jiayuan Chen <jiayuan.chen@linux.dev> wrote:
> So do what the softnet backlog does and use the netdev notifier:
>
> 1. On NETDEV_UNREGISTER, take the ring size and ask the kthread to
>    consume that many frames, or until the ring is empty. After that,
>    every frame that was in the ring has been handled by the stack or
>    dropped. The device is closed, so no new frames for it can show up.

That's not what the backlog does. flush_backlog() unlinks only the skbs
with skb->dev->reg_state == NETREG_UNREGISTERING and frees them.
It doesn't feed them to the stack, doesn't touch packets of other
devices, and flush_all_backlogs() runs once per
unregister_netdevice_many(), not once per device.

> @@ -528,6 +576,11 @@ static void __cpu_map_entry_free(struct work_struct *work)
>  	 */
>  	rcpu = container_of(to_rcu_work(work), struct bpf_cpu_map_entry, free_work);
>
> +	/* Unlink first, so the notifier can't wait on a kthread we stop */
> 
+	mutex_lock(&cpu_map_mutex);
> +	list_del(&rcpu->list);
> +	mutex_unlock(&cpu_map_mutex);
> +
>  	/* kthread_stop will wake_up_process and wait for it to complete.

After list_del() the ring still has frames and the kthread has to be
scheduled to consume them. kthread_stop() only wakes it up. When the
device is unregistered in that window the notifier doesn't see the
entry, doesn't wait, the netdev is freed and the kthread hits the same
eth_type_trans() UAF.

pw-bot: cr
