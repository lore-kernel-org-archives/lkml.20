Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793431953;
	b=bTAkHTrTt7m4GwzcvoOM3XbHHQSBGC07hOhjO5GEyidbGzNmrWzCFz5OECjrzOFEKm45
	 yQM19qhlxoGOPDMEOnyRruqejUxH2EZo7lg37j7D/AuAqBA/8lcUAUz2fL6Zqt2Chtsh7
	 5zPwKaRHHeYDTbW84Yz3Sd6BMdnlLMe6C3xwXlxPkQHWm04yIADl9lJj9maZY0KzFbDFi
	 u1i6M5MycFUKFCeZwFmUad97SmIUBMP3CWDav7p3gICUDnlhyIJaDXaFSJ/RGmbvcRmcx
	 DO2EB/Ej7H5WdrpdA8TpjdIuNEKZ3Grhg2AykA7wDdErOpplrYHneIp+fyItN/UtBlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793431953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SwG56EOzHHh0S1sw1BzNNeewAAIG+9Q3bqBhbj28D+k=;
	b=zP2Xv6yjXpbuWazbhpKzSl0+82EXJjZscOvswcUnbWdXdGZ4tKMMRKLvg4B2MgBla/b2
	 ZZifro2xnV5difL5ogYbTEqvV83EsAS/UCkbdMMbpwiFHNPbeFwJlS238WJBt+0R+2BIb
	 ncP3EDA7rfJ9iMwgettMyZ26imXgMyu4EVQOccX7jEbROEzcqWVq6/vp/VCeMNCcjVdeR
	 bV1cyj7fNboBJ/QlFEFM9mChZSYxRtt8lVuzTjWVJRZauzraXhXnOnBzngkm1QAb2crcA
	 GSUucqiQe8ATt8RFyHlPF853ou9WOjrcgeHottnwljxlnfXQbry6UxbcO3sVst7nhUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qh9Gb3B;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F960606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F960606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qh9Gb3B
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ae702d28c4so695874a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793431952; x=1794036752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SwG56EOzHHh0S1sw1BzNNeewAAIG+9Q3bqBhbj28D+k=;
        b=0qh9Gb3BneawzI3UrU54Pds8B6y660Y3v1867DL9iKcSsYE3qdeZjdSAtN7CKWXclK
         dhzlXts/nOAXK6soHQP7iIL+H1EdoNbbvaBdM10QQLuTf4PNIIUxhq4ZrvoGoTAMMBu9
         kO9zoOBKcFfnScszMYjg7jGBALYwrizjh7I9LQYey7R69zJD9kJFYjUCXe6GYBTvpRr6
         FgOV7S95lDGcVRQ9/HP6mYaJAZbKz1lcEdrtFCi9QxkBhaU0wH+ynl7RkA5lW7ny85RO
         TcHYjT8zm9J6t6WcF4+kYaYQ1n3zZ8fp8/XQ7P0gE0L3FDfGcWQW85Cg6zsDnNsoQBFC
         ZRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793431952; x=1794036752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SwG56EOzHHh0S1sw1BzNNeewAAIG+9Q3bqBhbj28D+k=;
        b=SAvgYj3IdcFZjNyjaR7WPwSDJeEB/qg8thOkHYp7a2XRiFZFEklzK0ApIo8kon90Ix
         E6Hfy/Xs0iAOta0oKoK91HwSFsczmtOu4EPsF0nVvvfO7h0tH+OJ2XxojSZS++fM+Iep
         Sovb00pIN201VLI77kNM0zUdFfckJvSr5SNRTdoX7jCRXJEu5Rb7wu0FnnDpCuKleWF0
         6nC9y1wbLn71eG+bPoxMsp+1vnlc7rCMrMZDVHH4mXaPJtW1MpAtQT8RG33XgBoC8gQt
         sdhDw8nCsYZG4nEKtfdYAN60eLG+9gStaA+fIwmBvJiMJGhADwlzkoJMf+8uWqyJV+RU
         TfMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlnDe0Txs3VJFLeRuvvjesCE/SfGeUpxXJUcRTmqg3/UBUt1nVE9mfsVeioK8WKvva8JHGGi1IZF0h6t4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKe4fXxkV5Tj0xpyQjzutteMEhtug02I+ggFAkj96WD9YGRvXdx
	X5yBjVXGl6lIVJQdKjKlJbqIM8FFILxQwMcdGq36E4Lox+p0u05pq5wF
X-Gm-Gg: AYBFou1Hq40yKywbXWAjAqb712yXBQ81O892Y4OOKVP4XWtQMMSjlbQm97xssrSf5ws
	Qpo5Rd1+rvMqMztuDXkeigokcI/B3FLd5bPJdQVR6SU7DU/ANxSUjrXYsZ5t1N6l/iXKwheseqU
	RAvQDOhbLHMPDX1SGMeB8bXMx2QB1OY6WT8iYp3ikKWSNpKCR/hQ8rXhJyYSJMOGb3/SMM7bosK
	rpxeCCwCGOXgQaBJxlGRdvGf1bvncUoKmChMM1LudtAJ/eHgpxGwyTygYWLkfmD9Sac6/kE0om4
	DItWBsjQueDqr9ng55ZhnmQTFjaRau6iuAKt52OHZCNb3VdmjhbU6jpeJG2b97rFBlVjxcTe+ZB
	MB6AhSMETi6Ndn14MmH40HuapSn9N7hlVdoPBpNSDiaHZrOQ6tqTgm5f8xvVVsK8thW29P5AAsq
	mkUzKtLbSZhQWqdz+nx+eT62zz3s2vDABcLFQtuibLXy5drx1LhUByMoih+8ICQI28UATJLnCLs
	jqKCTEBFaPksbzs+iIZWexvxWArbWajcedjP4LY7jcmL/mJUY59jpeba2oq8U+UtfhUKBKqyiUB
	WUH9a4PYQE1QJzWidfVSfVdLlg==
X-Received: by 2002:a17:90b:58e3:b0:3ac:80dc:f40c with SMTP id 98e67ed59e1d1-3ae897cca98mr3643392a91.14.1793431952431;
        Sat, 31 Oct 2026 00:32:32 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae841dd1b9sm6691486a91.0.2026.10.31.00.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 00:32:31 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3 0/3] Bluetooth: SMP: Serialize root channel updates
Date: Sat, 31 Oct 2026 15:32:21 +0800
Message-Id: <pm-bluetooth-objects-candidate-0184-v9-4094fa28af7bd56a283a-0@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The SMP root channels in hdev->smp_data and hdev->smp_bredr_data are
used by HCI event processing under hdev->lock and by SMP receive
callbacks on hdev->workqueue. Power-off already removes them under
hdev->lock in hci_dev_close_sync(). Two other writers do not serialize
with these users:

  1/3 The force_bredr_smp debugfs switch creates and removes the BR/EDR
      root without hdev->lock. A connection confirmation can see a root
      whose operations are not set yet, and a disable can race with
      power-off and release the channel twice. Take hdev->lock in the
      writer, and skip the deletion when power-off already emptied the
      slot.

  3/3 smp_register() replaces both roots when management powers on a
      controller that is already up with HCI_AUTO_OFF set, while HCI
      event processing and SMP receive callbacks can still be using the
      old roots. Run the registration on hdev->workqueue, where it ran
      before commit 2ff13894cfb8 ("Bluetooth: Perform HCI update for
      power on synchronously"), and hold hdev->lock while it replaces
      the roots. The caller waits for the work with the request lock
      held but not hdev->lock, which HCI event processing on that
      workqueue takes.

Patch 2/3 makes that hold for every caller: hci_power_on() runs the same
power-on update for a controller in the HCI_AUTO_OFF window, but has
done so without the request lock since commit cf75ad8b41d2 ("Bluetooth:
hci_sync: Convert MGMT_SET_POWERED").

smp_register() still warns when it replaces the channels on that path.
This series only makes the replacement safe.

Cen Zhang (3):
  Bluetooth: SMP: Serialize forced BR/EDR channel changes
  Bluetooth: hci_core: Hold the request lock for the power-on update
  Bluetooth: SMP: Serialize root channel replacement

 net/bluetooth/hci_core.c    |  3 +++
 net/bluetooth/hci_debugfs.c |  2 ++
 net/bluetooth/smp.c         | 38 +++++++++++++++++++++++++++++++++++--
 net/bluetooth/smp.h         |  3 ++-
 4 files changed, 43 insertions(+), 3 deletions(-)

---
Changes in v3:
- Address the hci_power_on() path that reaches smp_register() without the
  request lock, raised by Sashiko: https://sashiko.dev/#/patchset/99158
- Add patch 2, which takes the request lock in hci_power_on() again, and
  correct the locking description of patch 3; the code of patches 1 and 3 is
  unchanged.

Changes in v2:
- Address the CheckPatch and GitLint long-line failures reported by the
  Bluetooth CI: https://patchwork.kernel.org/series/1197223/
- Trim the crash reports in both commit messages to the headline, call trace
  and allocation/free stacks; no code changes.

Link to v1: https://lore.kernel.org/r/pm-bluetooth-objects-candidate-0184-v7-c26e53b52c260063ab6a-0@gmail.com
Link to v2: https://lore.kernel.org/r/pm-bluetooth-objects-candidate-0184-v8-60106ad0c49170f5bfb4-0@gmail.com
