Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794614413;
	b=lnbhwoh0one7mdx2MvLjLd3AC8glO+v6mhb7OSS7EZKZL6GUI70vfq9zoBgZSAJjFqNQ
	 vytFJn6KmT9ts5wf9IEfnXJMU3OdPc/qGk19noJksAJxGNGT3LBdFXfMZe/JR35NDxQRk
	 DlU5AboPb1T3hPbWcXhjmjUMt6vpy+rdFbjvtS46SAgHl7DwUic/mg0fRHuIqJcGSSZMG
	 4qKcycWJQRgvVpUdo4sERJpaMSFH1r++hcATfeu8kGz+uX1cdd50JZ6bB6RUuZUbqiyfh
	 /QIud5Wh0O2h2LvSJeFp4Z2JhyTKghLDKW7Dod3JXlsAFxwp9jIM9F8916dLE52yAaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794614413;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=QZw4v0aCkYznMOlE38G+SJU8NrO/wJd+sjMWG/kTics=;
	b=v+78J8/tFi0dctqH2HUmXn8LQV+xNB6+9wIdOUwvbXsbc2pZMUZHxXu7BpnryNgd/OYI
	 3Ft0+j8e/aAhcMU8f6byRt9V4irnAnah1D4QU87ejR0eWf1zCO6OW7JeENyb8zweDYljS
	 MFSeM92mKqyiI72AeMktWSGkJhuA0nmr84A3rbH6bqQUddvBqOD+3vazTvhOXandJB2YQ
	 nE/fMtyzAgCh9w0Pq/+t+s4B9ttOojh2AyYSq6laNVviBYP6JXVTJ65UjkT3FjM2Asdo1
	 BwePUsOn3TZldf328lkkjYRG48WURjd841xBorggdj59lcTPDsUUhCM4PkfQCwrvAyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=Nsti00om;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
Received: from sender6-of-o54.zoho.com (sender6-of-o54.zoho.com [165.173.180.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E66606A881;
	Sat, 14 Nov 2026 00:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7E66606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=Nsti00om
ARC-Seal: i=1; a=rsa-sha256; t=1794614404; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=D1Xnm7EBhctvGmjmlcTVkIgHnYr0f+ixSz/62kbDW2lv7PyzumOmnCwQauaIp4c6v5u/DNgTpZ39xq1ZrmPAXUG1b/hWLTmDqaD0F9mbLuvyhWMK0MKLOIhi2WbuKJc9vb/NYH7O8blH29V2y557QB2JigHjVibv45z3B8aLDFM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794614404; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QZw4v0aCkYznMOlE38G+SJU8NrO/wJd+sjMWG/kTics=; 
	b=bZabPQK24gDzhTPSy3Rc3ys4FnX5sMsc2QKryoq3gXLzCY05p6M1Y5X2rRUKXRQ7ICCbS4wOXPUkO8URdbOFzAt6FITt5pIqLfKEeH+4d2fDoY4CW28zJaOpgbza8tzafbwdML4fU47RZqNmtCPePwifDDNVcd5zQDf8TQX9qUY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=Nsti00omkPAKNDD6bc4N8XibTnvHuKVd3S0iB7WCQi1fJrljs+/zQP8IzZptd8n5Ssdg1Ia6oLlxfU1olaRXg7NinWByJQbXUjlDwsKCCsWIo+9jSHgIsSxRhr71Zrbp0h1a1T0cDhr9N+qOr7NQ7IVH70vNJmgNwSHkEHdS3ri9hlPhdHUWBgLslDF8Qw4CnW5ClPh7tWipHd3OoWtMD50bzO//bLSH8yPt9gfCAAGOBnYR6erxrlrCTpxKHpsAMShFMpvOvSgajlqoFBAACQU45Gfei5WTg1UrQrcDLCy4sI50cLpDp7oK4KLt7ddN6NhfHdmNwNJeaDz8kPCrvw==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=QZw4v0aCkYznMOlE38G+SJU8NrO/wJd+sjMWG/kTics=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179461440301440.7812653146234;
	Fri, 13 Nov 2026 16:00:03 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: Re: [PATCH v3 0/3] wifi: rtw89: monitor RX filtering, raw injection and channel restore
Date: Sat, 14 Nov 2026 04:59:59 +0500
Message-ID: <20261113235959.1039-1-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261104203051.564-1-owner@ph4ntom-rev.uz>
References: <20261104203051.564-1-owner@ph4ntom-rev.uz>
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
X-ZohoMailClient: External

Hi Ping-Ke,

Please disregard this v3 series and mark it as Superseded in Patchwork.

While doing additional firmware and runtime testing on RTL8852AE (plus
cross-checking concurrent MONITOR_FLAG_ACTIVE + STA operation), I found
several edge cases in v3 and posted a reworked v5 series based on
rtw-next instead:

  https://lore.kernel.org/linux-wireless/20261113235211.1911-1-owner@ph4ntom-rev.uz/

Key updates in v5 compared to v3:
- Use full legal name across From/Signed-off-by and split the NULL vif
  check and negative rate index check out as standalone bugfix patches
  1-2 with Fixes: and Cc: stable tags.
- Separated FIF_OTHER_BSS drop-mask clearing from B_AX_SNIFFER_MODE so
  concurrent MONITOR_FLAG_ACTIVE interfaces do not disable hardware
  Auto-ACK on an active STA/AP interface.
- Supported both standalone passive monitor TX and concurrent
  MONITOR_FLAG_ACTIVE TX with coalesced RCU teardown.
- Routed only injected control frames through the management queue so
  mac80211-generated BlockAckReq frames stay on the normal data path.
- Honored ASSIGN_SEQ, RTS/CTS, DATA_RETRIES (max_rate_tries = 63), and
  NO_ACK status reporting.
- Moved non-chanctx channel restoration to rtw89_ops_config() on
  leaving idle (!assign_vif_chanctx).

Thanks,
Enver
