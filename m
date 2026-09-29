Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D9C52D2C3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687524; cv=none; b=leSag7Jv0SvF9PIric7Hsb4f5814E5AhQPbN1IO32emxCXCQRBWN6U2kFTbAw3uX2JajnhKB9Wkru+zJqaE4HnUZZ95yVgaZCxJPMlIzTznZxGRXbqgnlMh4QYjCZofzo+fSOyqjYoHJNUMzNTJNPhYP9qAy/+0iUnzxt6b2TTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687524; c=relaxed/simple;
	bh=HTirRA90UalDWnFdFzCITcI7hIB/YN/mxlnPD1vae+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NeldK8TRMJPzXI5IcD5+0uI68p03Ip3FS8pLFYj+kSJcm3N+jb1N6DCi7t/ykT92PBumwXU9BjNcpOyMAVqEkQzDg8Df0Irr/rFRETeRW8qX6k/ayCWhcjRpDUoGOdmfSXYA2I5tuLpm+6uSQD8399EQi7VNFhifWZdDoTB5QNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j2tLd/+L; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2tLd/+L"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a4a98a79b8so79685a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687521; x=1791292321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UBGD0ul96jtIpbbV7jZQH0Vpd8aSl2z94lNjdsQZDSA=;
        b=j2tLd/+LDOV1eS1hccl82NizgR8KKMVRcl/gmOsJVRMuP8AreuP5ZNZwAKbllmRHax
         +V7D0eNpSHrvOH3T4sXXzk+bRZO2WMYQDh7EwdNOGYQt+3co2aSajL1RXRGb8dCeOCSB
         11MGb7ruIW4xVRoxjYnlgnUixmde8W9KdbCrdalFBp7ETHY44N2DJx3tQeJoKBLEJ5D1
         ZXMVdbrO50/p2385ceoRPYEfbfDCznzr7CHF3lHc2kSnie5Gs72ejAzujxo+vjhRfHh6
         BaPE2aVeiKYAe8uQBJ9B6OAyJwSH6c58Nd5djcZxk0vbj16dN0EWvFs9POgTVL9JRc+C
         zmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687521; x=1791292321;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UBGD0ul96jtIpbbV7jZQH0Vpd8aSl2z94lNjdsQZDSA=;
        b=B978adNU6pmV493zHwomFA0RA3/CFLUe7bkVUQ8VkuaLzyOcuCTWr4aYmbCi/uuRMD
         rVkFyKIe/72APRWlsNF3iFRBU5ZvhxFSWsfEptqAbAaqx/Zw/BDG3riF93nS/5e/7d6v
         Ekr8/07iI/XOcKViNv92bMCkZ4UTVMbl6oVmwTr6WFeyGbmxg0iNSsIwKj6SfAGI6+xn
         /cY3548rzREt7YmFOd8Y/kmqKJl7hojf69TkCQz0EyxjpmEns51vvsPKuwOf8aSiKZwC
         NwjE1uHqsoCrlL49ZY5HuOm3+iqc39GmDb1RoQByijgPCSErvhYOEgN3a7y3rL5wCgtP
         wY5A==
X-Forwarded-Encrypted: i=1; AKwUvBw1LchDxvAZj7O22uQjdXzNHtXV28Yh6ZhRWyULEFpHb3xvaxKEVBB9K6pQ918sPWHg9CJphiLP1HZRR7s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKK9eFzNLpowcnv4KDU79CjtVwtAmn1eJYIzjjK93ZjoioiKsbo
	L1ZLbMj5vlAhKX0WZzDN1g394WLtlkfBh/xnV9AMF2lL5Rfo+zo+s6q2
X-Gm-Gg: AYBFou0BrIPrDy1CqK2HLNJwaLn378ox98npBvoZyzvwTI0zGsMP2LgjSxx87fk0/FS
	cfw58SINghwy1jBKRJ3Dj7tFnoTYQ11kgBBDWKZjmg9TimC/QWLCNtXYOEINtx+zN/oBBK/B/mE
	WKvHMNosmepeAkcervPfU+yNYfryQvCeWQ5f4qjzDhZglwFuMJTS9tHl1+oHwb5H+7gWEe2LrgP
	tqtWnSZ6vDKE3G0GAliB1sBsmwEtFyVJBUDLOzlaIyrP9yO04MDRhHFkNus2UHe/mNS5cpMrgkU
	Dgae1Ag7JYrgUo32o5QfPDwqUjLAw4QOQ9yz68iVTfo8Xd4VqEVJcxKqH0aLJuEnV5TfOoSMYu2
	rRW0wOeUjBBa4Em6tyN9BSns7S5RhCVgc2LjLdleHZlBT92ObecsHI/IWA+gbWg3MfB3ssHmWTl
	LszjPJALlFUNZcDqgdYMXkepAPfugeJ+dpHWZ81LxiFWeL8+lZw5xdCXLSQh+w4rD+oVVzN43v+
	Yz58ZGYw2zPVV6Jc8SLOL0mcSZ8aLH2AW7IdjgCsYXo9wXuyJ+pSJXHvw==
X-Received: by 2002:a17:90b:3c4e:b0:3a4:88c2:32b8 with SMTP id 98e67ed59e1d1-3a488c245e0mr6140505a91.1.1790687520329;
        Tue, 29 Sep 2026 06:12:00 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4985fed22sm5582137a91.9.2026.09.29.06.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:11:59 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: corbet@lwn.net,
	alexs@kernel.org
Cc: dzm91@hust.edu.cn,
	wy@wyuan.org,
	si.yanteng@linux.dev,
	srcres258@furdevs.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 3/3] docs/zh_TW: link filesystems/ and cpu-freq/ from the index
Date: Tue, 29 Sep 2026 21:11:40 +0800
Message-ID: <20260929131142.266819-4-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929131142.266819-1-chenyou910331@gmail.com>
References: <20260929131142.266819-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

filesystems/ and cpu-freq/ each have an index.rst, but nothing links to
either, so their translations cannot be reached from the rest of the
zh_TW documentation.  As agreed in the zh_TW scope discussion, link them
rather than drop them.

The English documentation reaches both through subsystem-apis.rst,
which the zh_TW index lists only as a TODO item.  Translate
subsystem-apis.rst, with the two translated areas in its toctrees and
the rest under TODOList as zh_CN does, and link it from the index.
"Core subsystems" is rendered as 基礎子系統 rather than
核心子系統, which would read the same as the page title
now that "kernel" is 核心.

Like the pages it links to, the new page carries the notice for
translations not kept in sync.

update to commit 4f10f1dfb235 ("net: remove ISDN subsystem and Bluetooth
CMTP")

Link: https://lore.kernel.org/linux-doc/CAKspUhJAbCWoxgh2eq8R5g_MiNK=oXgKPUWqGOpHh0w1-Fv74A@mail.gmail.com/
Link: https://lore.kernel.org/linux-doc/ap5xEtMdwXS8Pvcf@wyuan.org/
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 Documentation/translations/zh_TW/index.rst    |  6 +-
 .../translations/zh_TW/subsystem-apis.rst     | 99 +++++++++++++++++++
 2 files changed, 104 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_TW/subsystem-apis.rst

diff --git a/Documentation/translations/zh_TW/index.rst b/Documentation/translations/zh_TW/index.rst
index 1dddf5963864..001680d040ea 100644
--- a/Documentation/translations/zh_TW/index.rst
+++ b/Documentation/translations/zh_TW/index.rst
@@ -39,12 +39,16 @@ TODOList:
 
 開發人員使用的內核內部交互接口手冊。
 
+.. toctree::
+   :maxdepth: 1
+
+   subsystem-apis
+
 TODOList:
 
 * core-api/index
 * driver-api/index
 * 內核中的鎖 <locking/index>
-* subsystem-apis
 
 開發工具和流程
 --------------
diff --git a/Documentation/translations/zh_TW/subsystem-apis.rst b/Documentation/translations/zh_TW/subsystem-apis.rst
new file mode 100644
index 000000000000..5c874aafe70c
--- /dev/null
+++ b/Documentation/translations/zh_TW/subsystem-apis.rst
@@ -0,0 +1,99 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ./disclaimer-zh_TW.rst
+.. include:: ./unmaintained-zh_TW.rst
+
+:Original: Documentation/subsystem-apis.rst
+
+==============
+核心子系統文件
+==============
+
+這些書從核心開發者的角度，深入介紹特定核心子系統如何運作。這裡的大部分
+資訊直接取自核心原始碼，並視需要加上補充材料（或者至少是我們設法加上的
+部分——很可能 *並非* 所有需要的材料都已具備）。
+
+基礎子系統
+----------
+
+TODOList:
+
+* core-api/index
+* driver-api/index
+* mm/index
+* power/index
+* scheduler/index
+* timers/index
+* locking/index
+
+人機介面
+--------
+
+TODOList:
+
+* input/index
+* hid/index
+* sound/index
+* gpu/index
+* fb/index
+* leds/index
+
+網路介面
+--------
+
+TODOList:
+
+* networking/index
+* netlabel/index
+* infiniband/index
+* mhi/index
+
+儲存介面
+--------
+
+.. toctree::
+   :maxdepth: 1
+
+   filesystems/index
+
+TODOList:
+
+* block/index
+* cdrom/index
+* scsi/index
+* target/index
+* nvme/index
+
+其他子系統
+----------
+
+**Fixme**：這裡還需要更多的分類整理工作。
+
+.. toctree::
+   :maxdepth: 1
+
+   cpu-freq/index
+
+TODOList:
+
+* accounting/index
+* edac/index
+* fpga/index
+* i2c/index
+* iio/index
+* pcmcia/index
+* spi/index
+* w1/index
+* watchdog/index
+* virt/index
+* hwmon/index
+* accel/index
+* security/index
+* crypto/index
+* bpf/index
+* usb/index
+* PCI/index
+* misc-devices/index
+* peci/index
+* wmi/index
+* tee/index
-- 
2.43.0

