Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.145.95.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843583;
	b=vfjw6jmC1H3Utx2OdBVSR026ML4rKptCm7NMsshEal9rvOekexQIxJa8H3qeEQTLtdUx
	 o24YvLe9MLwFVDnfUSwSl8bYT1O6rtR7yka4d7vaM89Bp8Fivc3BF4i1PjXHX6TfnLpa9
	 grPICWKE5zNczV8NnNodKEpPDwIfaPtGDqejn9ISY1iATWbYRQt6Am3dC6A6iylmPwOo6
	 /5EMQjhtpFXG4JElTDKNItFqTTM+hgsBnBJ7J//0z9Xa3pVQUTSbbFM8eEvzpLIkkMLyX
	 0PMx2SY1+mxyz21e+ihtAcTRwDGOs8AvjM7WPczA1e1FXCaaw3gDtvEJ7jjlIoI78lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843583;
	h=DMARC-Filter:From:To:Cc:In-Reply-To:References:Subject:Message-Id:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Developer-Signature:X-Developer-Key;
	bh=L9+smQvRCi3V8iaGs8P9KusdlduGgV/upfXJ+6epkRY=;
	b=j5ndQ4XCLw2TrM1Sy5tE7DFBktiLYc0j4t1mra3wBdQW691YCKmQVoqm947pGl3tv33M
	 X+4mJWnKznzNYlk0LOMepsBehURMP5FrpumEV11r84GF6uGoJfvS6D+D59OMQ1riXwJwX
	 6XFRWLx8Ol0xrQP9NZ4/IfPoNVFGPq7bn0lxglAt7IAaq2ZUqj4JBg12KCOJRlS3DwVBJ
	 3X3tpHF3tFpONG0B7xGntUukaD3F9XyenLii8zAtwWNGiNOmaHHdTDCVlFNMZRjnrQq3m
	 j+NjrYqUORa3qjVRiAQqpwG8uO8bKPrScbnNs6j24FP/j0NnEGA1MEP6SYSCc0vuH1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=toke.dk;
	spf=pass smtp.mailfrom=toke.dk;
	arc=none smtp.remote-ip=45.145.95.4
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3F9606A329;
	Mon, 16 Nov 2026 15:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F3F9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
Authentication-Results: mail.toke.dk; dkim=none
From: =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Luka Gejak <luka.gejak@linux.dev>, 
 Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mehmet.fide@screeningeagle.com
In-Reply-To: <20261026152537.1272836-1-mehmet.fide@gmail.com>
References: <20261026152537.1272836-1-mehmet.fide@gmail.com>
Subject: Re: [PATCH ath-current] wifi: ath9k_htc: clear csa_vif when a
 switch is aborted
Message-Id: <179484352190.153361.15210584021908832487.b4-ty@b4>
Date: Mon, 16 Nov 2026 16:38:41 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Developer-Signature: v=1; a=openpgp-sha256; l=298; i=toke@toke.dk;
 h=from:subject:message-id; bh=ntKfxr+T5nVeCTzN/Mj9ZPACsCrnf7z/4L69I/6dfOc=;
 b=owEBbQGS/pANAwAIAUNeEGz1+utPAcsmYgBq+yOU3Yb9V8kaRsKfnpo55XL64hPrddB5yMPGm
 AMm/iZgRFCJATMEAAEIAB0WIQQQshMTMFJycn1q0JtDXhBs9frrTwUCavsjlAAKCRBDXhBs9frr
 T1XjB/4924XER4zq57LFmWZhSNpFENckNjwShw/NRCE+I03BdQQbt4xzq3tZYs3QcgvNOzjWDxH
 AZMhKlBrez4gDJwpT9KOeONwZzAbbFANsaGDHPjv83JyE8ruwjOdDn8D0upkFO7M/SOtB4ugqnY
 OooxBF0q0midApatUtc2u4ChRVYYLOdFqA1KTNrGCXKDILORiBoRozUFASy0G3ZbM+4NuvTLI06
 fafAh5TCyQQYvSNmesCeEHGM8aefDsbzmQeTjMyjw/PkVZbQlAS54lVVqDQ693a67Ts3mPdMgVy
 5r0pkxWFvLZBf8ZDDrVWbPEp2XTo8h0w/cxj+qrL2VQfDDNF
X-Developer-Key: i=toke@toke.dk; a=openpgp;
 fpr=DE6162B5616BA9C9CAAC03074A55C497F744F705

On Mon, 26 Oct 2026 16:25:37 +0100, Mehmet Fide wrote:
> wifi: ath9k_htc: clear csa_vif when a switch is aborted

Applied to toke/ath9k-pending.git (main), thanks!

[1/1] wifi: ath9k_htc: clear csa_vif when a switch is aborted
      commit: f915ef9291f590deba4b9baf85a5f5a602061b4a

-Toke

