Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964744;
	b=DChrTc3bU6AlGFLEe1c4osgk4oNjouioCJ/eLoWf/HnORyheR/MsF3ChHrpw5P5AaVI0
	 7YZO5yH0WpnxvQFz82EN8dHNV9M7/cWBvvlT91cThIjFc8HtL5iWba1kHFzCbmsQTfaC0
	 +/1fqCAtEEovhvJ/rQaNIzyt6Dw/NxGCSiYizd/mRrUfUHaBIoHD70r3WWmgypzEMFlhk
	 P+DU3Qw58O4xlRCTB1h+uctmthaCl4eryF/HQslowZpXaR0/5nWyKYWEvKycI3xzSt35Z
	 A5fiI6e3r0TreJIEorITbwdx9rhOPnG5dUJFTvFzxNf8wpM12OWHXSjQ46SeD56PLrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=+5CEc3xRBtlmi0Ruv0ajJzuep+GZVYYLK7wyckUonGw=;
	b=l+MXuO8XyDy+gIydy3dPsqwY/3An4oiZ10uhBO+V4kj3oD+Uz2V+fX4CPe5h3dl/TatA
	 b8xp/eNUfo8KpA9eGamla3fme9UmmkOk+0tyqD8p8Khn/2OGszUStGjUgWVtBvDoEyfEC
	 UYc350Ykv/bQJE20GLeoyoWozYNVnh8Si/5y6fmHvCh7GqP5T1m0R+xWIAHWkM0c228vJ
	 RyOOXNZQ3KxVsc4XeHoB/tLoBcxKZNzwq6AJxsATSFVA7IcWPy01yvdZe9+1qFANtXQzG
	 4o+7J+TngpLajDEVcfjq/WdUjHK3qkfhYIdDI49NMF0Xt/DSseGtuuzu3QA8UNCUaZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Az0l4Gqj;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5361960A5BCF
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5361960A5BCF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Az0l4Gqj
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ad47c246f8so65326a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964744; x=1794569544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+5CEc3xRBtlmi0Ruv0ajJzuep+GZVYYLK7wyckUonGw=;
        b=Az0l4GqjjO+z1+iWHByhiBJw8Tg4foE2w9vocEgzG6m2kmqMcW9aufVpTRu9NzEqDL
         ZV5XHpXTD6Z4uZq1U+eoR0BegIt0Gqw+3joCnpC5xmG+NtYSJIbwb1Z0+tlzybvfsDes
         vL0pGyrdCg48EG0UN6bhtaeciQv9BI76/FzTbchXpvTclhoWWne9RRVqk+iJjTcxJ8vf
         /KTF1tU+nYoFeO/Ts0zTPT9AfVzJIvQ+Hg7iIgb1aoSlHW+wiUXMb4zurg9k/Omh8wLT
         9dm9uNKVwUZXTrCaCNLeFWiOaxFzwSMbCAIgIAmdUAvV95PNaG0hSY7qUmbyitw7X9Eh
         ilCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964744; x=1794569544;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5CEc3xRBtlmi0Ruv0ajJzuep+GZVYYLK7wyckUonGw=;
        b=odoCV9htRWU4oYGHMkzr4IcITDD9rjRsFUhln8Kl6+BwtAPuGFqMXGjU927MkrUzx6
         wTuO31IsJeTas8zaG1XlA6yIFauDP3J4uUsptDennPYXv31+s6SPGvLwX95KCU1HcFz0
         Jo2IN1Spqc6i9r6fs45gFD0jizO2Y7T6xJaHENkOPd9UhTfwS54mlr3djPT4pLbg0KCU
         4VFwAK0qatHUChjwsROX8ICu0zmI0lU32evY0OwlpHuEqZ54dmR7p3BPKq+Fym9Ba4S8
         wyDoReXnyjLVj7ujVn7CQhyI3bsUUC9DDmt00ZRVb2lOtu8n3q8qIWi7fkwo0Wf4tREv
         LAcQ==
X-Forwarded-Encrypted: i=1; AL+hErGaSG4LbAKzQHhBWDi02oKkKPXLERbpb4nb/WLBnvnzDzh/sDsl9QWKL4Ge4WNxD778OTMW/s6skXKfjBM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2vaJq5SKLxF6Yp/cIlM+p2kzhLqrzT0IaldcKoJVQ/7mXJB+v
	gV2mc+EoPLf+gI619CzWVwN7EU9cVeipWsecOsT48NPgMXJtD2W4ihYT
X-Gm-Gg: AYBFou1CCQZo5mZPoiSm8ZV/PJZOuzB5cJsNyFUwYCSUYCxp9JTHx/VWYLuN793NLXu
	0d6XfvX2MF7wCzY3ifCYZ2SX64AUZj5f2KtHu8Hxwn1+YIO3Y5cAzFWik6OjvLVDMboSk4NDirS
	AEDhLzmXbR3TcLaOOS6zy///4a2i/2Xhp5PGObZt5saClhSh+1/Cbr/ZzxB+ucNmsLc/WVw9PVj
	YDSvy9afAuk/okF4vwwqkEdM/Njgith4pBK/xa5A9cN8O91wrdIQaM3ZBHljYQnMOvzxx6b0i8C
	tF3QBSbhJ4793ESL86hT1lWw5wg6kU0RIrj6ZXjkM5Jt6inod452e2lZIC1OiI4dxLywKAcL2yn
	TrfwGu4DFvHDQnxGMOBg1VJa0itmuZkjl5S8pXoB0P/5OsYAz5SJl2Vig+DKjMCU4mc656AQLOj
	lQryH9VXCore3unZ9IHfXKxyEvDU+1ZdA5MW25lIncvhLtHSmnedPeiX7GYrEa30fGuj4iIf7rK
	/mq0pRM29MJg7N9AEjWQ2HUYvhaArv2OR80cwsPk9D67iTQyRhc2Iyx2YLCxyvHZB4sQcvIHhde
	kswuAg1QGrattlnTEmrb9t/qY3x+PKoyd//lTWcUXzEInLRlzww0JQrPedGIap+0IpRUKVOYgAM
	8m4NDC7vrEAQjaLtlHT7S6Bjy
X-Received: by 2002:a17:90b:2749:b0:3b0:d0be:f02c with SMTP id 98e67ed59e1d1-3b0db72428bmr3209286a91.6.1793964743401;
        Fri, 06 Nov 2026 03:32:23 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:32:22 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 10/25] docs/zh_TW: process: sync gdb-kernel-debugging.rst with the English original
Date: Fri,  6 Nov 2026 19:31:25 +0800
Message-ID: <20261106113142.706783-11-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106113142.706783-1-chenyou910331@gmail.com>
References: <20261106113142.706783-1-chenyou910331@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The translation carries "update to commit d5af79c05e93 ("Documentation:
move dev-tools debugging files to process/debugging/")", but as
commit e07f694cbd09 ("docs/zh_TW: move gdb-kernel-debugging to
process/debugging/") already noted, that marker was the oldest baseline
checktransupdate.py could see after the move, not the version the text
follows.  A section-by-section comparison against the current English
text shows the translation includes the lx_per_cpu examples from
commit 09e1d93a421f ("scripts/gdb: update documentation for
lx_per_cpu"), but lacks the "make scripts_gdb" step from
commit 6b219431037b ("docs/scripts/gdb: add necessary make scripts_gdb
step") and the "Debugging GDB scripts" section from
commit 7f7f468548ce ("Documentation: Provide hints on how to debug
Python GDB scripts").  Bring it in line with the full current original:

- add the "Build the gdb scripts" step and the "Debugging GDB scripts"
  section
- drop text the original does not have: the "(kernel source build)"
  note on the cd step and the "(command not found)" note on the
  auto-load warning, and a duplicated word in the breakpoint step
- translate "convenience functions" and "a snapshot of the initial
  version" as written instead of as "debugging helpers" and "some
  examples of the initial version"
- replace the mainland terms left over from the zh_CN conversion
  (調試, 內核, 模塊, 加載, 接口, 硬件, 信息, 文檔, 命令行, 函數, 字段,
  斷點, 鏡像, 控制檯, ...) with Taiwanese usage, and use 為, 啟 and 才
- add the SPDX-License-Identifier line carried by the other zh_TW
  translations in process/

Now that the file is in sync, drop the unmaintained-zh_TW.rst notice
that commit 6561dd301873 ("docs/zh_TW: add a notice for translations
not kept in sync") added until it was updated.

update to commit 7f7f468548ce ("Documentation: Provide hints on how to
debug Python GDB scripts")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../debugging/gdb-kernel-debugging.rst        | 104 ++++++++++--------
 1 file changed, 60 insertions(+), 44 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst b/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
index 45f178c0bf59..81e6433f16e4 100644
--- a/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
+++ b/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
@@ -1,67 +1,75 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 .. highlight:: none
 
 .. include:: ../../disclaimer-zh_TW.rst
-.. include:: ../../unmaintained-zh_TW.rst
 
 :Original: Documentation/process/debugging/gdb-kernel-debugging.rst
 
-通過gdb調試內核和模塊
-=====================
+透過gdb對核心與模組除錯
+=======================
+
+核心除錯器kgdb、QEMU等hypervisor，或基於JTAG的硬體介面，都能在執行期間使用
+gdb對Linux核心及其模組除錯。Gdb提供了強大的python腳本介面，核心也提供了一組
+輔助腳本，可以簡化典型的核心除錯步驟。本文是一份簡短的教學，說明如何啟用與
+使用這些腳本。本文以QEMU/KVM虛擬機器作為目標，但其中的範例也同樣適用於其他
+gdb stub。
 
-Kgdb內核調試器、QEMU等虛擬機管理程序或基於JTAG的硬件接口，支持在運行時使用gdb
-調試Linux內核及其模塊。Gdb提供了一個強大的python腳本接口，內核也提供了一套
-輔助腳本以簡化典型的內核調試步驟。本文檔爲如何啓用和使用這些腳本提供了一個簡要的教程。
-此教程基於QEMU/KVM虛擬機，但文中示例也適用於其他gdb stub。
 
+需求
+----
 
-環境配置要求
-------------
+- gdb 7.2+（建議：7.4+），並啟用python支援（各發行版通常都已啟用）
 
-- gdb 7.2+ (推薦版本: 7.4+) 且開啓python支持 (通常發行版上都已支持)
 
-設置
+設定
 ----
 
-- 創建一個QEMU/KVM的linux虛擬機（詳情請參考 www.linux-kvm.org 和 www.qemu.org ）。
-  對於交叉開發，https://landley.net/aboriginal/bin 提供了一些鏡像和工具鏈，
-  可以幫助搭建交叉開發環境。
+- 為QEMU/KVM建立一台Linux虛擬機器（詳情請參考www.linux-kvm.org與
+  www.qemu.org）。若要進行交叉開發，https://landley.net/aboriginal/bin 提供了
+  一批機器映像檔與工具鏈，可以作為起點。
+
+- 建置核心時啟用CONFIG_GDB_SCRIPTS，但保持CONFIG_DEBUG_INFO_REDUCED關閉。
+  如果你的架構支援CONFIG_FRAME_POINTER，請保持啟用。
 
-- 編譯內核時開啓CONFIG_GDB_SCRIPTS，關閉CONFIG_DEBUG_INFO_REDUCED。
-  如果架構支持CONFIG_FRAME_POINTER，請保持開啓。
+- 在guest上安裝該核心，必要時在核心命令列加上“nokaslr”以關閉KASLR。
+  另外，QEMU也可以透過-kernel、-append、-initrd這些命令列選項直接啟動核心。
+  這通常只在你不依賴模組時才有用。關於此模式的詳細資訊，請參閱QEMU文件。
+  在這種情況下，如果架構支援KASLR，應該在停用CONFIG_RANDOMIZE_BASE的情況下
+  建置核心。
 
-- 在guest環境上安裝該內核。如有必要，通過在內核command line中添加“nokaslr”來關閉KASLR。
-  此外，QEMU允許通過-kernel、-append、-initrd這些命令行選項直接啓動內核。
-  但這通常僅在不依賴內核模塊時纔有效。有關此模式的更多詳細信息，請參閱QEMU文檔。
-  在這種情況下，如果架構支持KASLR，應該在禁用CONFIG_RANDOMIZE_BASE的情況下構建內核。
+- 建置gdb腳本（v5.1以上的核心需要此步驟）::
 
-- 啓用QEMU/KVM的gdb stub，可以通過如下方式實現
+    make scripts_gdb
 
-    - 在VM啓動時，通過在QEMU命令行中添加“-s”參數
+- 啟用QEMU/KVM的gdb stub，可以
+
+    - 在VM啟動時，於QEMU命令列加上“-s”
 
   或
 
-    - 在運行時通過從QEMU監視控制檯發送“gdbserver”
+    - 在執行期間，從QEMU monitor主控台下達“gdbserver”
 
-- 切換到/path/to/linux-build(內核源碼編譯)目錄
+- cd /path/to/linux-build
 
-- 啓動gdb：gdb vmlinux
+- 啟動gdb：gdb vmlinux
 
-  注意：某些發行版可能會將gdb腳本的自動加載限制在已知的安全目錄中。
-  如果gdb報告拒絕加載vmlinux-gdb.py（相關命令找不到），請將::
+  注意：某些發行版可能會將gdb腳本的自動載入限制在已知安全的目錄。
+  如果gdb回報拒絕載入vmlinux-gdb.py，請將::
 
     add-auto-load-safe-path /path/to/linux-build
 
-  添加到~/.gdbinit。更多詳細信息，請參閱gdb幫助信息。
+  加入~/.gdbinit。詳情請參閱gdb的說明。
 
-- 連接到已啓動的guest環境::
+- 連線到已開機的guest::
 
     (gdb) target remote :1234
 
 
-使用Linux提供的gdb腳本的示例
-----------------------------
+使用Linux提供的gdb輔助工具的範例
+--------------------------------
 
-- 加載模塊（以及主內核）符號::
+- 載入模組（以及主核心）的符號::
 
     (gdb) lx-symbols
     loading vmlinux
@@ -74,18 +82,18 @@ Kgdb內核調試器、QEMU等虛擬機管理程序或基於JTAG的硬件接口
     ...
     loading @0xffffffffa0000000: /home/user/linux/build/drivers/ata/ata_generic.ko
 
-- 對一些尚未加載的模塊中的函數函數設置斷點，例如::
+- 對某個尚未載入的模組函式設定中斷點，例如::
 
     (gdb) b btrfs_init_sysfs
     Function "btrfs_init_sysfs" not defined.
     Make breakpoint pending on future shared library load? (y or [n]) y
     Breakpoint 1 (btrfs_init_sysfs) pending.
 
-- 繼續執行::
+- 讓目標繼續執行::
 
     (gdb) c
 
-- 加載模塊並且能觀察到正在加載的符號以及斷點命中::
+- 在目標上載入模組，觀察符號的載入以及中斷點的觸發::
 
     loading @0xffffffffa0034000: /home/user/linux/build/lib/libcrc32c.ko
     loading @0xffffffffa0050000: /home/user/linux/build/lib/lzo/lzo_compress.ko
@@ -95,7 +103,7 @@ Kgdb內核調試器、QEMU等虛擬機管理程序或基於JTAG的硬件接口
     Breakpoint 1, btrfs_init_sysfs () at /home/user/linux/fs/btrfs/sysfs.c:36
     36              btrfs_kset = kset_create_and_add("btrfs", NULL, fs_kobj);
 
-- 查看內核的日誌緩衝區::
+- 傾印目標核心的日誌緩衝區::
 
     (gdb) lx-dmesg
     [     0.000000] Initializing cgroup subsys cpuset
@@ -107,21 +115,21 @@ Kgdb內核調試器、QEMU等虛擬機管理程序或基於JTAG的硬件接口
     [     0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
     ....
 
-- 查看當前task struct結構體的字段（僅x86和arm64支持）::
+- 檢視目前task struct的欄位（僅支援x86與arm64）::
 
     (gdb) p $lx_current().pid
     $1 = 4998
     (gdb) p $lx_current().comm
     $2 = "modprobe\000\000\000\000\000\000\000"
 
-- 對當前或指定的CPU使用per-cpu函數::
+- 針對目前或指定的CPU使用per-cpu函式::
 
     (gdb) p $lx_per_cpu(runqueues).nr_running
     $3 = 1
     (gdb) p $lx_per_cpu(runqueues, 2).nr_running
     $4 = 0
 
-- 使用container_of查看更多hrtimers信息::
+- 使用container_of輔助函式深入檢視hrtimers::
 
     (gdb) set $leftmost = $lx_per_cpu(hrtimer_bases).clock_base[0].active.rb_root.rb_leftmost
     (gdb) p *$container_of($leftmost, "struct hrtimer", "node")
@@ -144,10 +152,11 @@ Kgdb內核調試器、QEMU等虛擬機管理程序或基於JTAG的硬件接口
     }
 
 
-命令和輔助調試功能列表
-----------------------
+命令與函式列表
+--------------
 
-命令和輔助調試功能可能會隨着時間的推移而改進，此文顯示的是初始版本的部分示例::
+命令與便利函式（convenience function）的數量可能會隨時間演進，以下只是初始
+版本的快照::
 
  (gdb) apropos lx
  function lx_current -- Return current task
@@ -159,6 +168,13 @@ Kgdb內核調試器、QEMU等虛擬機管理程序或基於JTAG的硬件接口
  lx-lsmod -- List currently loaded modules
  lx-symbols -- (Re-)load symbols of Linux kernel and currently loaded modules
 
-可以通過“help <command-name>”或“help function <function-name>”命令
-獲取指定命令或指定調試功能的更多詳細信息。
+命令的詳細說明可以透過“help <command-name>”取得，便利函式的詳細說明則可以
+透過“help function <function-name>”取得。
+
+除錯GDB腳本
+-----------
+
+GDB並未啟用完整的Python回溯（backtrace），這可能讓除錯GDB腳本變得比必要的
+更困難。以下設定可以印出python環境的完整回溯::
 
+ (gdb) set python print-stack full
-- 
2.43.0

