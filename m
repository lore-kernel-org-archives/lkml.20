Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337303;
	b=rUXBKHix+wlavEvaBCggRIWqWW/4kt1rUA86Xi8xQue8wm9rhDodfDNAHX+TsgE8PCay
	 3lE26ZUx2Qnyl7bF5bp/ovnHARtgngr7EgNJHUlkasXSHOSIaB4Ira765aDSRM9s8a2eI
	 9WR/PUU+q+hSHbagqNwaNdk+jIiM3I/eH1h85frkxohBZNnqRGdiwn3fMIFzGaT8++HXp
	 qqrSyGi/YDlnAGNLg3cjOQI35JezJW3tkOM/9ODmzbNVwSemm5ZyJMkkzrvQCwnZu+IcL
	 9H0iax2FSygzVT32UfpjRxk5ZUMTBexgWD4ihVdPQlJ1fCs/8+6h7F+5bHC/XHONH2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337303;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=u88fp4cNgurcVQQenB1U0uOBa+OAQVTV5+zevFl/QTs=;
	b=uKu5ijwKzP08dHsPMdg1eStVIBRX06jTXXypvE76kINZxi3HxayE3wQzB/jo0CuDKCnn
	 veX1jbldsS3UKvpbn6Hlm0M8PjyxGENpRkEbfxszVjo/2awlivphqIwSMasS+kHlOomBF
	 V/v53d+8Mo/RTfQnoKmO5JO6tMDLMHtTaHUA8Zgy5EQ5i+tvsEWwMvcedz47ZyVgp2rrU
	 Zo3DOOYfxdyRuTE9xlgDPAWzJNk/tZpKZZ2hGX6InJSo7W048r4ywAZ1vFJ0Js+5XIFE5
	 rW1obT4BXZPn107J17dd10f0IMGiskC1BGUmgyUCBBFR50hkyroyfWKTqOkFStF6GLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=wI2MqrjO;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F19C606A33D;
	Tue, 10 Nov 2026 19:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=wI2MqrjO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=u88fp4cNgurcVQQenB1U0uOBa+OAQVTV5+zevFl/QTs=;
	t=1794337302; x=1795546902; b=wI2MqrjOjYnjkXCzfBXOaqfom9tvoQ6c5U6snfyiIkug0C9
	pyOoNejTh5MJt5EzoY5TXylIbnenIY350GEh97x8xLOoF/Z8sYUtH6fGmyZQhvHKYwrVnV4wMUm+3
	lY1IwVZYy0vG6illl/XV0ulEPGTgZHYSMC2lpXZPa+GwFi/9OMxY7srdkT2NDCA1+pHjLryldBk8/
	U7AVGQk9m10wH2rh4hU9H7Wy3QpK9YWvnnf5PlIj8anrtJkAMrUQJUPIwazAg8+3CNv0Y6CF+IBPE
	+djXIFSwOaWbI1chHJG1RIVF0/C6ryVQjf4+cHz1X+GvsAifwM4U6GTgImLA+kgQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xQr6B-00000002Bi6-1ti3;
	Tue, 10 Nov 2026 20:01:39 +0100
Message-ID: <4c5dc50b40bde5cd9221d318e44645d913268666.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 11/21] wifi: nl80211/cfg80211: define
 API to notify SMD Drain completion
From: Johannes Berg <johannes@sipsolutions.net>
To: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Nov 2026 20:01:38 +0100
In-Reply-To: <20261106-smd-v4-11-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
	 <20261106-smd-v4-11-62e39487f51a@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
>=20
> +/**
> + * cfg80211_notify_smd_drain_completion - notify userspace about downlin=
k drain
> + *	early termination.
> + * @wdev: wireless device corresponding to the AP MLD
> + * @sta_addr: non-AP MLD address for which DL draining is being terminat=
ed
> + *
> + * Should be called under wiphy_lock.

"Should" doesn't really work here (it's either must or not), but anyway,
why, it's completely unnecessary?!

johannes
