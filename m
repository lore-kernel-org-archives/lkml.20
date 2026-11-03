Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793707163;
	b=1AgY7TBtJMmmcy8LbzJYVOTsVZ5fb9bHoMy/tcw4S+ptAUxgOCG6PbJkJa5WSdFYOebV
	 IeJ1sQ2K6SsC/zbitRx6OWZaBe+n4Kj1kxU6LBPTOqFzy7CC7BF7czBhjAOAVA5qyw0Ky
	 mNLeLYR/AmIZH8pN3fbNzQk7OqMZqvf/7MNpryEllg6zoTYVauXuJuZpSqsS2eKliUa1e
	 bwW07Dr6y1RMjSHHmyyhpv/FicGzgN2qmYYlnqgHCEMpmZCbzYeigKp3vp4dO3VdTv/J9
	 Of9KDugTKCSHVIBl10x6C8yKoo59XbIlz+u9q2G9257z7nWPM/t5Tbd833kQO+23tGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793707163;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iUfWP0gZ5M6iBLPSiBoMZN0m1Wh7MhtVvTC+zv32USM=;
	b=hs4eXWaA7xgEzK3lEd26hHwSRX9y3CNvTs5a1jvBdAHyfZzwoes9j1dG1tUWb4vNzikv
	 IPxW2eKa4be+A0UJVURqFPU+Ts9RSV/aDioXJ4yiFZfYAdFqEm+QJPlasQRAqIifXEP6P
	 1gQFqG+Dv4eXa/SvMTIVYviZpujz1/0Uy3wzfmdVKTtfqKSDZOTlpYuxipLUFg2c2Dz26
	 bMhy140DBK5aTJZjqQG9gz4MclzG6Nwa51DbTVxJdfNsAZ04Dl3AEsLQc4DvcVpLaS/Yo
	 AVksW42Xxt/6xRG+s1R8RDRPylcVC7NIKjhLoopeAn2vAMVaW8rvR94MwWbHhh4sSsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=xiaopeng.com;
	spf=pass smtp.mailfrom=xiaopeng.com;
	dkim=pass header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=GC+UxmLB;
	arc=none smtp.remote-ip=115.124.28.171
Received: from out28-171.mail.aliyun.com (out28-171.mail.aliyun.com [115.124.28.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14CD606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C14CD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=GC+UxmLB
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1793707152; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=iUfWP0gZ5M6iBLPSiBoMZN0m1Wh7MhtVvTC+zv32USM=;
	b=GC+UxmLBG5UV+aQpscFJC9vcdbWW9WteHN9R5dV/4LPvcqfLuOcnWxmPZzWo4PV0mH4lY+atQ5IpzLVAiWHXiMCRM08tsTjznqF1DzE0rbH+pfJKn0sfrfvTJpCKD9/n0hrVilaCjKZPLlt1rGVyNM9yzk+DXL5WFiNYbGvX770=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1805161|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0534605-0.00286774-0.943672;FP=17573517344319433842|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037028158;MF=zhugl3@xiaopeng.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.jvrFsq0_1793707151;
Received: from DESKTOP-UL5U09E.xiaopeng.local(mailfrom:zhugl3@xiaopeng.com fp:SMTPD_---.jvrFsq0_1793707151 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 03 Nov 2026 19:59:12 +0800
From: Guanglei Zhu <zhugl3@xiaopeng.com>
To: mst@redhat.com
Cc: amit@kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liuc63@xiaopeng.com
Subject: Re: [PATCH] virtio: console: check the control packet size before parsing it
Date: Tue,  3 Nov 2026 19:59:11 +0800
Message-ID: <20261103115911.478515-1-zhugl3@xiaopeng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103062747-mutt-send-email-mst@kernel.org>
References: <20261103062747-mutt-send-email-mst@kernel.org>
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

Fair enough.  I was wrong about the buffer contents and about who
controls the stream.  The real issue is that a bad length just makes
the driver act on garbage values, and nothing in the switch derives
a memory access from them, so the patch is hardening, not a fix.
Keeping it withdrawn.
