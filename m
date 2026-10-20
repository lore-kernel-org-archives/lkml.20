Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456563;
	b=3VI5+CNPyC7KgGdr2RUCNgJnG0bwMG0qEY6kCRPPFp3UX/QfzYOV2IP7teowOyC2G6Rf
	 RvJml3QdN2j9MU1I36LEju7xPXdL/3prlN9XjbwvNk+NyrgWVEA4GvZAHKODBIe+QhkFd
	 LNOBaq79HyfQpAE0sI2s03CjGOBg8iAutVzMIkcgv/YwGGJnNDKsjpzlp7yECsuerqAuB
	 ELmNNoVn7/Woi8VKMNjh3SfHTZKOjUKnCTYcd0uFNgNkvUD6PLwdMl05RG6/q8POvx0Ef
	 qMUImkUhSLjbkhwsh5MujPgP+ZrehKDNb0W+XH3OE5GgP2OAkxq0fP+jIs1X+F62u9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456563;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=mypQyYyod7FbsUHTBuDz8BoApKJwDuLXZk29pLmZ7Ow=;
	b=N621pzVAQRfWfxvf2kR67V3WDAaUGNVeSbB65KL2/FL6ypBuOzkPKgg3cNWG648PYNWL
	 inCLDtf1zMXPYMqwKJJ+m0oc0ISceMwKlBlYF2NgkziObQ8XgGfaeWssVGy6Ej5VtM1iu
	 umgrcEKNMuVSexxtq5xUrZ/snUVHLxptyA2IuK5oAzPPvWX1GVhdY5chqCkfBtLyE3wKm
	 OFuEv5iOIpS/r0CIRVUpsqGqp9q/cCzbIyHXO0F8etzOJP3DBb2U+7snd4M9pq1AnevUi
	 lZ8EGOlbZ+biRNbcOau+ZkUZ5IGafbOaqC/gbJvB4raFKsO4oUi2GdDf69lUxl3GAYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=j+nNSKr1;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55BA606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C55BA606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=j+nNSKr1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=mypQyYyod7FbsUHTBuDz8BoApKJwDuLXZk29pLmZ7Ow=;
	b=j+nNSKr1GDAjP+jg3n23lv4fe/QVr0ykw5XaBoFbQ0/UwtBrgXiQiJlRzYMf6l
	jg3Lgns0hwo3Bw6HYS8BeRzGtvjYPpCVJrjhBuPYAq+d8FcYcBeIa4VmeMiQZLnr
	5/Fo4XGhXSTud/MjpYwF9xQeU2YwNy/uwIok3pygjoBlg=
Received: from shaos.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3v9Bft9ZqHddJBQ--.50832S2;
	Tue, 20 Oct 2026 08:35:44 +0800 (CST)
From: shaos <shawnq1@163.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [BUG] fs/ntfs3: nocase lookups alias distinct ADS names
Date: Tue, 20 Oct 2026 00:35:43 +0000
Message-Id: <20261020003543.1010357-1-shawnq1@163.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v9Bft9ZqHddJBQ--.50832S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXry7tryDCFW5Xw4rur43Awb_yoW5AFykpr
	Z7t342yr1xKFn7Wws2yF1FvrWIgwn7AayUKF1093s7Zay8tr1ruF1xt3W0yr1furyUW3y5
	ZrW0vryDJ34DZa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UWWl9UUUUU=
X-CM-SenderInfo: pvkd40jtr6il2tof0z/xtbCzwBWZGrWt2DtqgAA3R

Hello,

With ads,nocase,iocharset=utf8, ntfs_d_hash() and the slow path in ntfs_d_compare() convert base:stream names but use only cpu_str.name and cpu_str.len.  They ignore ads_len and the stream name.  Two different Unicode ADS dentries such as carrier:é and carrier:ß therefore hash and compare as the same dentry, and the second open returns the first stream's contents.

HEAD commit:    5dd1818b15d98d4a20806cd00b1b40320b06004f
git tree:       upstream Linux checkout, local branch master
source version: v7.3-rc3-313-g5dd1818b15d98

console output:
https://gist.githubusercontent.com/shaos26/8ec54c999a8be8aed41f7cf3c2cd3a53/raw/33e333f56adce7cbdcf30c739a94d212d0de04f7/console-output.txt
kernel config:
https://gist.githubusercontent.com/shaos26/8ec54c999a8be8aed41f7cf3c2cd3a53/raw/98f68c316e64add97f6e7084b160ca561c103240/kernel-config.txt
reproducer:
https://gist.githubusercontent.com/shaos26/8ec54c999a8be8aed41f7cf3c2cd3a53/raw/3617a80a8398b22a9e0f15e9dd8cd0d30e0cba0a/poc.c

Create an NTFS image with two distinct Unicode named $DATA streams, then mount it read-only with ads and nocase enabled.  ntfscp is from ntfs-3g:

    dd if=/dev/zero of=/tmp/ntfs-ads.img bs=1M count=128 status=none
    mkntfs -F -q -c 4096 -s 512 /tmp/ntfs-ads.img
    printf 'BASE-CARRIER-CONTENT' > /tmp/base.txt
    printf 'ASCII-ADS-CONTENT\n' > /tmp/secret.txt
    printf 'OTHER-ASCII-ADS-CONTENT\n' > /tmp/other.txt
    printf 'UNICODE-ADS-CONTENT\n' > /tmp/stream-e.txt
    printf 'SECOND-UNICODE-ADS-CONTENT\n' > /tmp/stream-ss.txt
    ntfscp -q -f /tmp/ntfs-ads.img /tmp/base.txt carrier
    ntfscp -q -f -N secret /tmp/ntfs-ads.img /tmp/secret.txt carrier
    ntfscp -q -f -N other /tmp/ntfs-ads.img /tmp/other.txt carrier
    ntfscp -q -f -N 'é' /tmp/ntfs-ads.img /tmp/stream-e.txt carrier
    ntfscp -q -f -N 'ß' /tmp/ntfs-ads.img /tmp/stream-ss.txt carrier
    mkdir -p /mnt/ntfs
    mount -t ntfs3 -o loop,ads,ro,nocase,iocharset=utf8 /tmp/ntfs-ads.img /mnt/ntfs
    cc -O2 -Wall -Wextra -o ntfs3_ads_dentry_alias poc.c
    ./ntfs3_ads_dentry_alias /mnt/ntfs carrier:é carrier:ß \
        UNICODE-ADS-CONTENT SECOND-UNICODE-ADS-CONTENT
    umount /mnt/ntfs

The trigger reproduced in both opening orders and returned the first stream's bytes for both names.  ASCII stream names and the same Unicode streams without nocase returned their distinct expected contents.  The KASAN-configured run showed no memory fault.

Impact and prerequisites:
This is an object-confusion and data-integrity bug, not memory corruption.  It requires an NTFS volume containing distinct non-ASCII ADS names and an explicit nocase mount; no privilege escalation is demonstrated.

Validation: The alias reproduced in both lookup orders.  ASCII-name and case-sensitive controls returned their expected contents, and the KASAN-enabled run reported no memory fault.

Thanks,

shaos

