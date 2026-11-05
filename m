Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891358;
	b=F49DvtPL1VKmnv7bpkgaiCjXZL+eiG9RdPR+93RkPjwHtnxczP89UgmaSTKMWHb1n/eC
	 DiCtCDUWWqmPCPb6cYZoGWZWeUNwaktbUq8kPmGQocwWPtRe5k9tcpGrJQrcrNUVO7EaJ
	 6hudXvok00Tjk9C8wwQRUyavO5vhGMiOSUA/ekfDqnYXVR4lNMLukh7ggGAFXpUdixzuh
	 dCKUGWsNE4VgC/OZKfSDxKI0pRL6u+W2mbcTllR2n/4zj0Q1hZs9EnVpmi+tpg6UXgv8d
	 RpWdZzq+nW9lX+GaekNN9OzITmuLiGWV2Fna1glX0UpMRbhRzm/gQfQc/w3NTk9D2AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=NdBlg6gYq5FYgjcrPv2VAOO7NpyllcS1uRLuU2fZQxA=;
	b=0Cn30OA3XY8pnoHJ7tPITZz8kRDLTafGl5jsC3vN0EKH3ayll0JVhJkY8JEqTlkNJww5
	 qrGVQtEoMYhWpvyjHwc792MllVzmB6D+TvL6+6dUr/wTMs03RpBo6TwnuPy3Z8qYHJ49Y
	 NkVSBoh09lNx8WhT4qzkgYKtv+6yCkOP8qKFu4lXwK+TIqvxJVs4Vqk1ZEh6O0aR4d6PU
	 9phN9pNY4cChPLAxq6FAFU/9r+kFTxpullquBzwqxTQJb/UKz7JrndA0JlDNGVa30ClKE
	 qUll9Q7os85drPm2hb5CDbX+tNCDKpnz1NH58CCYR7aG+eVqfoOsw9xnctELMI7NEqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Iv+ajxLf;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8C3606A333
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F8C3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Iv+ajxLf
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b3299aed39so7375777b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793891357; x=1794496157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NdBlg6gYq5FYgjcrPv2VAOO7NpyllcS1uRLuU2fZQxA=;
        b=Iv+ajxLfNSH25B+2wOZA7n+woEwjyDhKAGrHX3Nzx/11Wyo65fAJU8wFnLwBVzV6Pi
         UAYgYLZaIL/rgSDm25Agi0uDM3qAYuImlr8d53dG5LS7RHChP/NhdevUnSpsVJQAvl+v
         tKoY05V+ZgT+EJmFs/pQO+Vqf6NigffgzUlG8gbVrE4NbXE91dpvJ23GdDjUoZhpR/gt
         8R9gruH38UmlhDoIFFK7g/FsV1dNYdnVGumdDJ4eEvdkGG6JY+c4GUbm2nN7RMGLWOPu
         QVHz9DZ/2qOJFOonVBNlwQPTLLcRtLO5lZ4vmdpFnC/met97pV9905qsk6Em3L2sdcQV
         g2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891357; x=1794496157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NdBlg6gYq5FYgjcrPv2VAOO7NpyllcS1uRLuU2fZQxA=;
        b=Xu5nAVUEpiSHlkQP4ACWMti9+KVjs2S+hpl54OJwvRrOTOYhgMIw8wCjnVdy23G7m5
         GbqUjR/r6ZfGozPRAsRdw5i7x995CUzXdiq3wKIMEJ0wx6Slb/Derr5+WwnIqRfuAMzx
         0j3X2dXTY/qBBalmPq+cccMbXV1u3fjGEy+RnCjlTdFvuQVNTEkq7dYaVo3y3cF0naWN
         W5iyI+2i23xt0dt/6/JDJmrLJDPlCTKi3bXrbyArI7K8b0z9RGExi/BnBBHu4J1nrB4t
         Do7ABDQ+suojP8n2x0SlVspuMfyVlFp5k9S9jLuSmyl7Pm+KUv4R4JZIh1NhcbFASwCa
         aUkQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+QV/eHLiGE0BW+q7hMjB/sdZkyVoTVUJS8y2vkPWVVNB1w3kx8MC5GDndRLIBfHR4CVCelW3LW4nkZZU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TNdCQlSGE++8yPaKurBZRI7gKqbFMw6gGTHG9q+YXrhmLmmMB
	rX21jfnZL2GFWZrUF1h0MDO5vwnPzTPrTVRCHqfuI9LxqVWTn+fNZVbbez51MYJ7L18=
X-Gm-Gg: AYBFou3mlTi4lcTp3HEpF9TykjdDETrmP8qOpld7XmpEEZ6j+FC3BfAm/8tCs3AAXJn
	7xk/S1TWzpYvw8pQrpgWwGrDzDYjgUJ8XWQ65Ro3x4B5At31jMWiqlk71gy1lD88RLnbB9sqMyL
	xws0g8WM3jIiS04QlTgcqT4Rej+r50EEfJ6dT5kUGEGtQhWssurdPBnu1x3LvtcITD2jEPx0XRr
	5xB6L+oL0jMSMjivzfq8pRaVDmsuZj7mPrw4LU+n9tiVF4Gl6TjDcPlk7hc3xhsFR4onJvnTHyb
	4peCk3aYnlueq5gb/L3a74+EJZMTQxeRuCbBIxc2jPxpiqBH6xC01HXuLl483NCsY4PljMZVpdF
	7amV3CR1Cayv4dBmjodcUxE7D4KzV4Dr8DdLj1p+cnwgpD0MOhVD5MAZQ1cidJa6sQjrOHJGmuA
	KYXZZzlkqucGSDbGHzZy4JqeK5miRU8rp0C32xsBvmsZbp+w+vlST+Whj309hE4LQydmoDbb1Vz
	w3hzQnjEU2AptQxYWo1tlOR7epiD6A2yaY0DPdMY+2UVBfuZK86Muupbww59iL/WnZKTU/fnkPK
	rGyp573FMAKa7u+g2S3Ll84SNJJhvBQxQlskfcdmZqmZwA==
X-Received: by 2002:a05:690c:f82:b0:8b3:2eb4:1423 with SMTP id 00721157ae682-8b32eb41a18mr8941597b3.25.1793891357471;
        Thu, 05 Nov 2026 07:09:17 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b32f0f9631sm12195477b3.36.2026.11.05.07.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:09:15 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:17 +0000
Subject: [PATCH RFC v3 25/90] cells: add cell_kill()
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
Message-Id: <20261105-b4-cells-v3-25-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890933; l=1887;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=5JqCVnXo+nzIia4E3k6kZfSHS0ksAk+mWBsP6JoVIn4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKM4qPz8cvz9J28cjtlEHW2fyVlbs8kjfbTCGKh0F/nQJkD4VSuLMpzbTc/K14cYHUTqimw3XJT
 TtPEig+lyiQQ=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

cell_kill() kills a cell and everything in it, in whatever state the cell
is. A cell that has not run anything yet is torn down immediately.
Otherwise every task in the budget is killed, and the teardown happens
when the init of the cell exits. cell_kill() does not wait for that. The
cellfd becomes readable once the cell is dead.

This is a separate system call rather than a command of cell_configure(),
which only applies to a cell that is being built. It also means that a
seccomp filter can allow or deny killing by system call number, the same
way cell_info() separates looking from changing.

Holding the cellfd is the only requirement.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/cell/core.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/kernel/cell/core.c b/kernel/cell/core.c
index d0243779af19..b9494b5fd7b9 100644
--- a/kernel/cell/core.c
+++ b/kernel/cell/core.c
@@ -310,3 +310,31 @@ SYSCALL_DEFINE2(cell_create, int, parent, unsigned int, flags)
 	cell_put(cell);
 	return ret;
 }
+
+/**
+ * sys_cell_kill - kill a cell and everything in it
+ * @cfd:   the cell, in whatever state
+ * @flags: none yet, must be 0
+ *
+ * Kills every task in the budget. A cell that has run nothing yet is torn down
+ * on the spot. For one that has, that is for the exit of its init to set off, so
+ * this does not wait: the cellfd polls readable once the cell is dead. Killing a
+ * cell that is dying or dead already changes nothing.
+ *
+ * Return: 0, -EINVAL for a flag or a file that is no cellfd, -EBADF.
+ */
+SYSCALL_DEFINE2(cell_kill, int, cfd, unsigned int, flags)
+{
+	struct cell *cell;
+
+	if (flags)
+		return -EINVAL;
+
+	CLASS(fd, f)(cfd);
+	cell = cell_from_fd(&f);
+	if (IS_ERR(cell))
+		return PTR_ERR(cell);
+
+	cell_kill(cell);
+	return 0;
+}

-- 
2.55.0

