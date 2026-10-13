Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D463D9DA1
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909128; cv=none; b=O2jV3wY7ObbmcoGrzM3em3zpbYfEfxcvwPbFLwa/zFdDDjIx4ZdkMQh2zybk4m7Xnvewr876Ch64ZMFvPgqLjOwMBgxOan48ELl2Xs0iy39HgpP0g/I5UTiGu+GI1ZToh3lhpAqlpgVVK5Tv7ci3/EjTPBNa13GiQF4LG8M8KMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909128; c=relaxed/simple;
	bh=Vgr0WYR5Z4FHX7CgrOaLp4+C+70T/vz4si/Blb6H8Hs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=hoV0GvdbE6Oz4X0DqZu4PcsVHj9AHRX/QJNc/PYQMds7aN3Pfr+M7wZot1pQm3Fv+b8UGrLdUt60gAOWfkcxyRit3lFkcp9XLyBcaHEpap2Wkq85Q96Zi6UQWeXvLZpFUaAXdh/noYAv3eJjU0DUNoQpjb/IIHGaXFwMSOjYp98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZff9MOs; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZff9MOs"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a8adb68d8bso2217385a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791909126; x=1792513926; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/XZgfappexi6EW2yi/fmjgPEZvZ4nymZlscgutlwwIw=;
        b=CZff9MOs9nJhyrmb6ksAEkSvEeAIo0mo0Y3s3OoqGGpQN4XNFwaHzYmxVmAK7CnVeO
         KS/X7lUn2HZcsBTPzuVj1uGa7YmpnB+2OIkIZDa15kmcHmqTktljKpQhSpe4EH1QGovu
         vJpGeVCU227piEQ9EI0qkFtvtdLaZmJz07kcj+vMOeZPc5JmAwyPVrfT1sozTojXEr2e
         DqadcC76WRND4BXZj/KbvhYeCwRJ/m1fKXXdIkY18t4vETEgUjAY9aXOemTTELhmzqbb
         /jgcFd/RnvOHTbBoA4q/5+mfvfkMTn2k4OQlhmraxRwJrFN5q4Xh7afuvgzEZNLhMsJm
         o+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791909126; x=1792513926;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/XZgfappexi6EW2yi/fmjgPEZvZ4nymZlscgutlwwIw=;
        b=muSrweRlRHxVqdYYpxt5JhuqgNbuhOybkNzWQG5KxdyW5/AWA249a2M6dCNBKCvnKk
         loHEzeLLRzEyLHHLnJ9q7cdhMPLlpkU48H5OrtjQ3gO+F3A7lt2d/iwnZBcHXp+i7UFT
         HMFVjPJPmTNYqgx2t0bboyA2GITdYZLidzTUMZ6Yy5m3VcA1x3nxP2hNzrkB6ncy/9Th
         PE18RtgWGUc3JDBv0sw8tNn7UrBCIQSLHO/4+6/0L9yr8O+AUGRuFRHWyqxUSk3Xp8ni
         vysYcYgf6/MsxMGmlKVFwaoGPNsjDu0ovyXdkIjalhqxeMc3odKlbbKUrI6U08T2NGTj
         kxvA==
X-Forwarded-Encrypted: i=1; AKwUvBw4O21jI8ef9xSn8sqtMUe+uUpXk7e+puQt1pVm6cTTLJZp993CeIZjL/8hcM+jTVo6KvvtYuO45QHDsIU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDb61rXvq6UYUAA6WBuwViNAHNWmW2ny6wkNiOlg3u0MiC7f+u
	JeusiW58XeR+dvC4KQDKbBqCJblLPN3YnbUHgyTDhACb5dTNFd5I68Jy
X-Gm-Gg: AYBFou1iIqUov3FlAbppFc2iLJ3Ah2vBGfOBidZak/ScjhpeMHQ9YhpDidUGsYZziqP
	8YPMmU9s/F4rXnUOTmMqbcqOXFwPJkWiCy3YAjTlT6uR+fEpaBI8VDdgE9i5RWwgYIc/H+e+Ma7
	mZoZ4KykS9UgQx5SThTakSzf7ha+qLrhO9q4uvkxJVpunGjIhUb3NRgaM1+qcwC/5lKoHcrh8Fi
	mE4is5rGq1t9VpMDBC2ZFIYcRIeE0Qgqh1SY977oUdErvHEtHZ3N6shsMWEMRTULMl8RH6bWleB
	VVsJA+e+mJqNvK3rm4xzfxfeaE1/U1vXxJ96g50BytOEK9Ui7u8YuufOsBTWyiND8qgH/NGVYix
	C6BYcWqy3YZ/15+FAYgkU1u/KWZ397UrIiBEkXae/9jlfj3szHSVUI8SeIQCfBdyEUrCn5p3Y55
	yQQQBN7zQk2cPnwWmQTQSeIYsJce6kzFySeEFN+1/2auHwcjIuGFdoT/wgyNDFZgpQFg==
X-Received: by 2002:a17:90b:2ec3:b0:3a4:d5c0:f826 with SMTP id 98e67ed59e1d1-3ab3ae32be1mr11385868a91.65.1791909125906;
        Tue, 13 Oct 2026 09:32:05 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac60e83ccdsm236454a91.15.2026.10.13.09.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 09:32:04 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	pav@iki.fi
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] Bluetooth: hci_sync: Drain LE timeouts before disconnecting
Date: Wed, 14 Oct 2026 00:31:55 +0800
Message-Id: <pm-bluetooth-objects-candidate-0087-v9-625f001f92d657dbf938@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A pending LE peripheral connection can be deleted by power-off while its
le_conn_timeout callback is running on hdev->workqueue. The callback uses
a raw hci_conn pointer and waits for hdev->lock before calling
hci_conn_failed(). On the request workqueue, hci_disconnect_all_sync() can
abort the same connection first. hci_conn_del() cancels the timeout
without waiting for a running callback, and the walker's final
hci_conn_put() can free the connection before the timeout resumes. The
subsequent conn->hdev read in hci_conn_failed() is a use-after-free.

Disable and drain le_conn_timeout in hci_disconnect_all_sync() before
hci_abort_conn_sync(), while the walker's existing reference still keeps
the connection alive. Do this outside RCU and before taking hdev->lock so
the callback can finish, and prevent the timeout from being requeued
during teardown. If the callback removes the connection, the existing
hash check in hci_abort_conn_sync() avoids deleting it again.

A matching KASAN report from an instrumented kernel showed:
 BUG: KASAN: slab-use-after-free in hci_conn_failed+0x3f8/0x410
    Read of size 8 at addr ffff888119e391b0 by task
    Workqueue: hci0 le_conn_timeout
    [...]
    hci_conn_failed+0x3f8/0x410
    le_conn_timeout+0x286/0x360
    [...]
    Freed by task 509:
    [...]
    bt_link_release+0x87/0x180
    [...]
    put_device+0x24/0x30
    hci_disconnect_all_sync.constprop.0+0x163/0x460
    hci_set_powered_sync+0x48f/0x680
    [...]

Fixes: 94d9ba9f9888 ("Bluetooth: hci_sync: Fix UAF in hci_disconnect_all_sync")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index efbd2e5387c0b..ba573aeebba88 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -6083,6 +6083,15 @@ static int hci_disconnect_all_sync(struct hci_dev *hdev, u8 reason)
 		/* Make sure the connection is not freed while unlocking */
 		conn = hci_conn_get(conn);
 		rcu_read_unlock();
+
+		/*
+		 * The LE timeout takes hdev->lock, so drain it before
+		 * deleting the connection. The reference above keeps it
+		 * alive while waiting.
+		 */
+		if (conn->type == LE_LINK)
+			disable_delayed_work_sync(&conn->le_conn_timeout);
+
 		/* Disregard possible errors since hci_conn_del shall have been
 		 * called even in case of errors had occurred since it would
 		 * then cause hci_conn_failed to be called which calls
