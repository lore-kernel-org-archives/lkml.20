Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821139;
	b=4Bp4SMQlRXoFohPxLyYw2/7hKNaOgsBZtziS8jgTt9/9scM9DA+2Bvs6wHpGmABP2zZf
	 Oc1MgLa/qFyV2pWRlSPgLwpGpjJeFJUvOACRlZQmRuiVKCHja9IuXmjbpvYkLn9L/BiW0
	 5llXHo/Yt++E305go1oFTUpwfODDPVqH1+fD7fc8b7tyNHFwHI4UOHAm5k+BcqXqdwRXE
	 w8YJWrc6ui28xHLoBWGxITaz9fNiuApuOeExpKYPX5evC6qH8GKU/MwIr0p9rC2jqFKhW
	 iI7zNJldxtgWMsuMt/6lKH9eyviggTcpClDDaez4GJmuXXJK7vvn6Gp4SXEYRUintKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821139;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=QRvZNiuCrRRCYJgUnEhOyKvi2OgtHRK0l7dRSkMMy/s=;
	b=EkN6aDOYQROC2vQ4HgzMFsnlnRdLRojRRHwIJ1XxCjP03JnnjUzV1NhbyDn6YQAQCYoi
	 3UWzrafZ3HWdW9fHkLIdR2HDigkXL6koazGuSezisrQYmSlaBzsyWK0hYc6jSmrdEjCOu
	 yg8Szn+ciGROFt5FSONkarHA5eycFstZwlOFFe+qODbPqietAWKQCddaN+nZ7hn1euOBC
	 L+WPJOS/1p2TIRefy+Szb/ZfciDvkmQ3NBYMWlK/GIWi3f0vtsc7jfrtbzwu7AFlZu6WJ
	 8t7JiyuxIGp+F+5EsGUzZmQ3vSBz6R2R5QH3bYxa/uvw32Io2+4WiJhaCtrMvxUtutA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=KHm9svgj;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F72B606A32C;
	Mon, 16 Nov 2026 09:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F72B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=KHm9svgj
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AG9PXEk83290704, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794821133; bh=QRvZNiuCrRRCYJgUnEhOyKvi2OgtHRK0l7dRSkMMy/s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=KHm9svgjGe523Qv7OJxhAV5DjbxjsBrbDJn7dqeruzWq7SMGFFAYHB0z2icFgkq8W
	 yaIqCaOqmTbCNbgDO+lt3drwOai6DeRZJo3mtcHwgwKEInVs3ydqHr1LCbGZvXfIyS
	 w4HT3VoVFq1BNXMU3cRBvYuWXVQwcy1SdWUAhSRps7VvbfM0viMtMfbxf3OtKFCADo
	 qyKuBS9s6CnUjh8jfAGZaRCiX2+djn2nFncHP3Z2vTo4/nYG6XXvyxIE2gICBCFY+F
	 rQM16fMT2nz+JqTheSbiZ++bXflG3rB0KEV47kwhzw3uIGY6ceWwfRhU3fu4oTK569
	 Rr+qCK5Q+5X2Q==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AG9PXEk83290704
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Nov 2026 17:25:33 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 17:25:33 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 17:25:33 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 16 Nov 2026 17:25:32 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Zhao Li <enderaoelyther@gmail.com>
CC: Bernie Huang <phhuang@realtek.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v2] wifi: rtw89: update PN state only from
 correctly decrypted frames
Thread-Topic: [PATCH rtw-next v2] wifi: rtw89: update PN state only from
 correctly decrypted frames
Thread-Index: AQHddawlSYo1nXKUTUeLKh6IMBJip7cwbWlw
Date: Mon, 16 Nov 2026 09:25:32 +0000
Message-ID: <7040b729e3a04d3a953bfdc4fd8ab416@realtek.com>
References: <20261116092300.20414-1-enderaoelyther@gmail.com>
In-Reply-To: <20261116092300.20414-1-enderaoelyther@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Zhao Li <enderaoelyther@gmail.com> wrote:
> rtw89_core_skb_pn_valid() records the sequence and packet numbers of
> hardware-decrypted QoS data frames so that it can drop frames whose
> sequence number goes backwards while the PN advances. It runs before
> mac80211 discards frames with an ICV/MIC or FCS error and requires only
> hw_dec, so a frame that failed decryption still updates last_sn and
> last_pn. Such a frame need not come from the peer. One with an advanced
> sequence number and a PN between the recorded PN and the peer's next
> one makes the check drop the peer's following valid frames until their
> sequence numbers catch up.
>=20
> Skip frames that rtw89_core_update_rx_status() does not report to
> mac80211 as decrypted, or reports with an FCS error.
>=20
> Found by code review and not reproduced; compile-tested only.
>=20
> AI assistance was used.
>=20
> Fixes: bda294ed0ed0 ("wifi: rtw89: Drop malformed AMPDU frames with abnor=
mal PN")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhao Li <enderaoelyther@gmail.com>

Acked-by: Ping-Ke Shih <pkshih@realtek.com>



