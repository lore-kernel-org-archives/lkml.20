Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891497;
	b=s1y3jWw+b/m4VIQc/sTf4RINQBg+xSF8UQtLqt8yvl0xzG6rSjp3RnWmS5k+KyNaTYnI
	 4nSv+Kp9COQP5fgJaOoeR48cn8qfAw4a+RrFNYtDF3thJgEucsvFsV8q+kgUzS790rHsl
	 4mNfkdXDcOKdjX1aSWvA5qcRdPHMGAVavXTiYgKXTs4foSiP4E+WZ4qHq9TIKNcLR8Umm
	 vFTXaWQTkKY3BtXJmfjJ5qGclST/T7nYDg5QMpVpk/EEZkwmzGGJM2zK70dKwgnjBYxE4
	 WrXKi/jvquskhMAiuFgTRGO0kznlOpSSFoQfWaLJexN26Yws1Sol9NKC9v7OjSjMueA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Z4cDAXNUc3K0ZnV8t9qeV2IWpTEwGu9zEe368I5KRhs=;
	b=WIPSaMK94xi7X4VOMD9uzijAuMwuNE+N+Nc3NDOl6MooRrlO1HPfvmgNbDk87Yffk/TZ
	 3vfA+ze6/CoyqoQwIdE7rtKU6OyyJ3W6XvteX6s/dpH9ZUs2cXA4F83rV1+NZvoxJfIqK
	 Sq9JCEue8+EfKtJM8dlksTH5kbIS+R0ixXRF2zFSHYK1ByPNqItlJ5hN4uldNXFidivCX
	 UjTxotZBYd13pDABuzCeWNHYXhRHZ1tOvQ2oCJD0cjXnSK59tWpjGZY/kzVuKCvpf4vUR
	 wGCxa21jjOkV8cPjPkZK50MoPsWJaerRj/Jk5g0AA+SJQ14b+roxYXr2bJZeOhO6KBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Z7hjdC7K;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0BD606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE0BD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Z7hjdC7K
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67a2bd0c297so2370263d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793891496; x=1794496296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z4cDAXNUc3K0ZnV8t9qeV2IWpTEwGu9zEe368I5KRhs=;
        b=Z7hjdC7KFLenFl7FXbc8/a/MApH4kHG/F+vzQLiU7jpzn8lO6cElu0doYGbj7zW6Ol
         XiRFd3Qemnk/gzEpyoVOu+MXDDyoiLakMjm41/IcyK4QOo8WYNBP9K7fV3YkU6Yd7wS3
         r3GVJMcySopCMpbM9zDGo2Sa6pNH4YpltbYwPugZWWrF/k07jhUbs+7HhB1soUccTi2/
         RKHEP6tc5FUIRLvbzFWsr8YiSks4Ckpc75CQcgQgfcILuk9oTJLfNGYps+QifcaWuYn0
         3xLycrA6gF6zQP4paYREno/oc7XHNjgHNrV0ApYL9YQbM/wEi5FwIa7aRlUT2kHEMPz1
         Jedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891496; x=1794496296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z4cDAXNUc3K0ZnV8t9qeV2IWpTEwGu9zEe368I5KRhs=;
        b=U/yLH+rrkvmcoX+ZgY7rLGq43KGEM2Ap02vFMAhSr9i2y31UE2il+IRmm8rWc8h9OC
         PeIHU62FmGF/hP6l3nCP4JyYBe/tdt9GVhBImDh3xppDvjp1ygFMsGOHGRWiy2e/khRv
         5es3WKMT+yJloauKWZ4xU3ZXNJT3srp15e3TmsOeoDw+AJiNR/pSX0HdhF5TA5NnL5vC
         dEDzWBoSANLri2hqpT4TSvv1BGPGgq1wUwgKI0KfWlFEL3KKzNV7sIfcPpmhX6X5ena9
         YpwvqsVd7NwsQBnJz3XSsS1dDFa5qmtZ59n0mClx0I/unPhoIEbO/IvvTUd5pgk4NX3L
         y9Gg==
X-Forwarded-Encrypted: i=1; AKwUvByK9RyHz66POSs1rnEy8CO26S6tLJ5rOzP5DlPaDZ2y97qbr86jXPlk6x/yvqV8wP8mN1sOxAenkagaliQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gCnUcE+dqclyQhGL3u9mXcI/CNi5MC59AH8A+HahcR8YpP7p+
	X5MWKs0IAxwTwIrIACsgcBn5uECz4XVJUDaCxVjWhRlPrD1YrqLI8YRwtBij4RMpE4o=
X-Gm-Gg: AYBFou0PtIKPSq3qKaX3HjyjL/sG3m7v937x7VFen0I0lhr8gD76mRkdRaQH/wxnPD7
	JIUBoy5ykxOHSYt/Acq7Mnwu1dkCK/DE42pTGdLo3+0p+X9o/Oiftx3qT9yHBbYCdqqs2HVu+Rm
	CvrPUKj1qkpt/J1ENThA8HmJiepOuHcfFbhre85xWYggqxyeTI0sploMkZtfnB5oOFsiXz//0XJ
	NjCcgzImDWu6jk/iyZIErxQR8xdcswIA/LswX0x6+N9UP5+l7zne6wN2w3PBSHG5xLVWehjNHNW
	UxTj55KchkXGKFOERMCYn/NI0YYAq2jLI+0kQOstFuI4Mt3/iOEFbNF/Umal4aobxTqeduYRZUN
	qdvesdfoKYcXDMWasLSTGJ2CLIDOeZGaopo/+GZQXphqimsqf45U4QoDQ68KQpeqPl8fRg3UUm7
	B72wm9Lm3hXAfIsTLvabdhuKWUXzL4P5oFWPGwDHyIH5lrJD02dW9jkZQe8S6+vYOr1YQsl+/Kk
	UVYH5Jeoc6TxrNN74j3Y5eL2g9TjMINceCt5uVDjgyeEvDALLPSFZcnq11U6QoVrqan9QeSp8JC
	XLfwEPuqdIHjn9AWJpiApbcEMcHy/EDXJ6yGEU6sfKptvA==
X-Received: by 2002:a05:690e:140f:b0:67b:e21d:93d0 with SMTP id 956f58d0204a3-67be21d95aemr4949251d50.51.1793891495619;
        Thu, 05 Nov 2026 07:11:35 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.251])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee202a69sm3637395d50.5.2026.11.05.07.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:11:33 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:23 +0000
Subject: [PATCH RFC v3 31/90] cells: reserve the "spawn" slot
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
Message-Id: <20261105-b4-cells-v3-31-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890933; l=1264;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=gcNNSOpmtg4LFK/nczfAl3jZs/cLgmyYRarla2n4+3E=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNtLSJl0XJSKcO3eClfCZfC34206VfWEtH0ipup14MIhs4/yc0YDmKjrvowwvtET2E6oAPELu5C
 lO+QownXUowY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A task of a cell can neither create a cell nor start a task in one. So far
that looks like a side effect of the fact that no cellfd ever gets into a
cell. Make it an explicit rule that does not depend on that.

The rule fits the model: a cell can do what its slots hold, and the right
to spawn is a slot like any other. cell_may_spawn() checks it where a cell
is created and where a task is started in one.

There is nothing to put into the slot yet, so it is always empty for a
cell, and a task that is in no cell may always spawn. This patch only
reserves the name. Nested cells can later be enabled by filling the slot.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/cell/slots.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/cell/slots.c b/kernel/cell/slots.c
index cc732c4e09f9..6ce8892f7908 100644
--- a/kernel/cell/slots.c
+++ b/kernel/cell/slots.c
@@ -165,6 +165,9 @@ SYSCALL_DEFINE5(cell_configure, int, cfd, unsigned int, cmd,
 		if (IS_ERR(key))
 			return PTR_ERR(no_free_ptr(key));
 	}
+	/* Reserved. See cell_may_spawn(). */
+	if (key && !strcmp(key, "spawn"))
+		return -EOPNOTSUPP;
 	if (cmd == CELL_SET_STRING) {
 		str = strndup_user(uvalue, 256);
 		if (IS_ERR(str))

-- 
2.55.0

