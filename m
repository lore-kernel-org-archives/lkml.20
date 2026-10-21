Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.62
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588521;
	b=IvBlOarcNlpmNvnjXdbzSKwQR3lkC+RRpzz6ZIc+f09QH/WIQffrOXBDmY8D8OxxhtbL
	 bIYETz7hgkPW8z33G1WI7egD8PBXbvR4QpqRdXCD00ZQANfIMbaPl5oV3t3jjrk8Y5SkK
	 lFk7/JXVEIKOJBP/4fvhi9T5EeeuDFI5UjY7RAetPNOTpAVuespoTqs1JsoYs9hX+aHXy
	 Xx3A24TWTvJuPS91jvssysc+hZg5pwo5GdvjyN+jYAPPzcWzmFclTMmcXlQC2/2W859/H
	 mm6URppmBSbE4YcxGzwLPvoAjvyT1OhSfjovOGcybIvJ4kJoRK0LggE7I2KTIZUKACA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588521;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=25tT0iWAaza7QxGD2QYScSMgIohEN6wH5AsbhN95NF0=;
	b=f81BbmGtAHLTGLOQhjskBiKbxm/1GFOOEt5yuAbj5Xbym6YFSfe1vypwQkQAWzZ4GVf0
	 vGzublgae04Rrgacy7Ih8EMzKfYL9eH4sP7VxIfCzs+F5MD5vsn1umSMIBVUNorIyVF57
	 HBVj78PgncW3HzUEz7qAgarlYpg29bVIULa3EnznEquKkXPBXDp4z+epjo5PYvE9T5BVM
	 5d3QrOdxFd00waQCld+EPMYma8SQ4gE1lLlWoj/blS/qnFPtI4XI1PVUa+7eof1veh7QJ
	 dzawThIYKxtynwlk/Ok0pdO1aRaQbvRHYwFmS6ZF71d+B0DsA6hI5FXg8gjnFUCeJ9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YozOGwqj;
	arc=none smtp.remote-ip=95.215.58.62
Received: from mta1.migadu.com (out-62.mta1.migadu.com [95.215.58.62])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4164C606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4164C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YozOGwqj
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6Qz2Ilvep7wV32LmbUggAolqH0DqXa97icyiQTw6Km8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792588512; v=1; x=1793193312;
 b=YozOGwqjtAkMEgs0e8oFWHksYr06nAad8n8oZTl01tLhDR6EANCGAE7GAuLpzjzH8SYCofkJ
 eU4gpSQ2YxZOZzF0AREjiFQnONl6HwrEr4liwrhMSs0Ym4IJcgFxbAmoJXn+w6QyXsA/SOmE3o2
 vsTpdc9aUGADpsAmM5iwu+Xg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8513f95346aa54ba;
	Wed, 21 Oct 2026 13:15:10 +0000
X-Mizu-Trace-ID: 8513f95346aa54ba
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 21 Oct 2026 13:15:10 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <d62975cc45c5b17a85f1e5cb7f9c1e326f27ffa5@linux.dev>
TLS-Required: No
Subject: Re: [PATCH rtw-next v4] wifi: rtw88: pci: wake the TX queues after
 restart_hw and interface up
To: "Abdurrahman Karadag" <abdurrahmankaradag19@gmail.com>,
 linux-wireless@vger.kernel.org
Cc: pkshih@realtek.com, linux-kernel@vger.kernel.org, rtl8821cerfe2@gmail.com
In-Reply-To: <20261021101315.1974894-1-abdurrahmankaradag19@gmail.com>
References: <20261021101315.1974894-1-abdurrahmankaradag19@gmail.com>

October 21, 2026 at 12:13 PM, "Abdurrahman Karadag" <abdurrahmankaradag19=
@gmail.com> wrote:

> Wake only when a ring was recorded as stopped:
> mac80211 keeps a single non-refcounted DRIVER stop per queue, so an
> unconditional wake here would also release the stop that
> rtw_hw_scan_start() takes before it reaches rtw_pci_start() from idle.

The gated wake still releases that stop when a ring was left stopped. A
stalled ring followed by a disconnect keeps queue_stopped set through
rtw_enter_ips(), and the next scan from idle then does:

        rtw_hw_scan_start()
          ieee80211_stop_queues()
          rtw_core_scan_start()
            rtw_leave_ips()
              rtw_core_start()
                rtw_pci_start()
                  ieee80211_wake_queues()

Nothing transmits in idle, so this is harmless, but the v3 thread settled
on saying the wake can't be narrowed to the queue the ring-full path
stopped. Could the message say that, rather than suggest the gate keeps
the scan stop intact?

Other than that I have no objections with the code itself.

Best regards,
Luka Gejak
