Received: from outbound.st.icloud.com (st-2002h-snip4-11.eps.apple.com [57.103.78.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE403414DE0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.78.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182235; cv=none; b=G79IZ9yDDLs2ywu71oEmxD57CCr7tumAhLbUFKLVCLRl00ptSCPPLNeVCLGIA/nrLs45VnB99BUbn6atAxuOAXjE1hLJwa1jeRINEKaCSAxdxp+ZD4y7yq8yDlcPn0bZ8keAsh9961rqtnRjqjs94cVZ7enxCf46HJP/B+QtRFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182235; c=relaxed/simple;
	bh=3/beUJx10Bu3Pcl/YQ29DbawiaU1Aszo14MSQ9bHoho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ApYa7Z+6N++HQLz+Tg1TbFQqVCrIAY6iXE22SGxRj2MifvY5LpnPoY+afADt/fSIadmw57rVBEyHRVO96qcL1eOZp6jgR01KzBc0hwordQmEBCN6+46mi776KYoTjsiPIigYsOErZ1eCT1fB6YTttmAiOY/0YNdpP+VCX5XoKQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com; spf=pass smtp.mailfrom=me.com; dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b=jxg2K/yB; arc=none smtp.client-ip=57.103.78.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="jxg2K/yB"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPS id 3B7A818025D0;
	Mon, 31 Aug 2026 13:17:08 +0000 (UTC)
X-ICL-RepId: 01a057f7-7073-7381-af7e-142f9edda47e
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQhABkMAWBxBDkkdXwVaEhVdRVUIRRlTHhccRgxFGVswVB0dDlgGEhZdRV4IGQhdHRkKUFAOS1oVVRcOAkIfUB9MFldDRB8cGVoUXBhTRVEfVFhDGUVWaUELTx1dGVscQmRYVwkKBldeWhdeTVoCVk0FSgNfAVsKQwhJAFwAWwNeC0gDWg5YH0EUHlYfRQpcXl0NUh9FAnIdXFZQAlpVEgRACFZQXgheH0wc
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai; t=1788182232; x=1790774232; bh=3/beUJx10Bu3Pcl/YQ29DbawiaU1Aszo14MSQ9bHoho=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=jxg2K/yBbZQvuLhmLnRZ2jIt4eWLI9AuPsUCubAMyQhPPdzdvgiyCOhmOgLXJoWXoMpZqOGZFjSo1UBReqmOp2lUkXwzvMvghsxtQSz//8h6iog5Qr9oaMnagYyv7eygCAhHLfhLTbnbuXYyNSRhxXKRvpjR5fpRjgUp8i697871oP+n8LHM8hF7K80Sd/RXal2ANeSm6N1CaY3kJ1FqSyKda4hVTYFaPwyUpsAZoWxQi2ADVU9+PXevsJ9IgvI1gaLhwEGdDAdug4aCLNAR8jKwHWfLntDmAYwgkrruX9G3dWIIlL3S7kqB8NWQo57q12R9zD3WUdnHtbAsKKvQvw==
Received: from ncore (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPSA id AB56E1800CE1;
	Mon, 31 Aug 2026 13:17:06 +0000 (UTC)
From: Ferran Duarri <ferran.duarri@me.com>
To: Alexey Bogoslavsky <Alexey.Bogoslavsky@sandisk.com>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Yehuda Hahn <Yehuda.Hahn@sandisk.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ferran Duarri <ferran.duarri@me.com>
Subject: Re: [PATCH] nvme: lower default APST max latency to 25ms
Date: Mon, 31 Aug 2026 15:17:00 +0200
Message-ID: <20260831131701.200793-1-ferran.duarri@me.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DS4PR16MB692456B5425BE0974054C45692AD2@DS4PR16MB6924.namprd16.prod.outlook.com>
References: <DS4PR16MB692456B5425BE0974054C45692AD2@DS4PR16MB6924.namprd16.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: igq9J5bSi09HSGx-EJA4bRPLqKQmF-UR
X-Proofpoint-ORIG-GUID: igq9J5bSi09HSGx-EJA4bRPLqKQmF-UR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDExNSBTYWx0ZWRfX4gGzkpFdGDMY
 SKIeY3Dst9/b6aGFqncbjSKvKoImrcKN3jGyRG2rNdoldF3yanlskXHNcl2MyEAQW/j4ON3eynu
 oluXRes6Gjc0GcifZj8hB+lLdrMuLlSDHhnxx8wEiqqH4PBUFXgU7AVQmdRMN7bRDqQfQsNZm+v
 T9uLyJoJ5nY2ZnB/TcPAbrgVky5KHeodIOAEqHrDvv0xC0aFNnUpcB5X5x2Py9SIdQoKrH74+hC
 zQUYiCrAMiuXirHnTdXRPtgGn/x50U9kS6o2shUtfCeBCEbimRzFr6wihAxtpxKPE5nX4XF9cWk
 VivjI42Eyr1tZ7X1tSqULsMFCUdwUG97wcYdCyto4YKobuGwP6/S8B4HVbNfZA=
X-Authority-Info-Out: v=2.4 cv=HfsZjyE8 c=1 sm=1 tr=0 ts=6a957ed6
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10
 a=B9nqV3Rn1-QA:10 a=VkNPw1HP01LnGYTKEx00:22 a=8FC1iW-_3rLwuDBYcQIA:9
X-JNJ: AAAAAAABX2WitX9bonD7lzXzpyC5bRJULoSSFQlXF5akb8mbhTUPNDnYIdVxfgzlfHruFdQkMvWbknx3FZdaoiGqApkOX3pKj66u1dq2NUXKC0jkKtuIiBLohLk31IK4jaEzVLy+j5x6Fz8pW672JFQ5OI14ybLglwSeyypV6lqUE1kPFpO/dc6XsXOKtehepMkwTIji8pn0VguKwpjhE1xzs+kk1VXtNphogfICeagE2csGT3pJnP34DmxUE7jZUrnJG9pfJXHE7RDycK1u+LvyfvHPNODypqjeEoesT5xghVVUXgSLKAgKa9Ngo1Su5erX3/rAfw9s66ynjTJu7CE5U+SNITgY2TanzMdNMgYf+mXmPVb4/yX4IoH3YNGpwr/l02sr9QbS1JqWi+58GSrRc1kRBT4YvBF54aqeJ33ZQ98HkJzyzzUBdsYPkjw6zbJXlSDMHrcqLsTLAN5Hw5rLQHAaCHu9VrflV+wm4UhNHfOj9tW/+HI8XiZnlVHx5w8YRY17vcc0i/jBDfMc/CCi6R0q2esD/XkueMeFn9KqxjNF+PMlVZtuVyX7JVLAgTIUORsjQ7Bj9jh8JPxAfkskwBMfic4zGgxpqKJwLlYUzPFpBDF60asNbNAKZPrdnKc0HivDvTabConwN+KJhwiVtRo9YeqI1RgY6kTHMwP75YKAdZAo+2Q4Up4tTGLyb4kqKrDYlACsqLj6c6gS7ETdAC5eN0jm0OLTn52F7wo0y48+YIBWt8q2K5vFtGLZ4oajxijZm/TcnHMZQfo+Abm1DR97DzGNNK9eucWDvEdCL3nGXrJQgYNYCzVxwuLzhiXdwXRQo1B9M9WjcedNXtv7GD9yztMH4btdCSrYGrVEfj53mFsV3xFjbvU3OYPJuEtZth+hIueggk0RQTqVr7hhK0StdFuJYeiOQRn1OX0MeZ/0bTCzWMfhueRJNhvUm8MRqOO+Owd8B+5qKTAqecJtYvWuBEb
 QXIO54y1kmICSsYLcmKYjTPH6N53UJSyxxSQwnpwhYxIDweictnG7/CKfWWhbgvHsYQF65rVdZOgdCVFJoCncSdpzjWncWI6drOXiwAXwEi5+e5U+rtcdaDH6Yw9CkpbqSWXR5yBjO8pMaTrX0i2/0Mkyl2/YSNXKlT74JUr8ktFzrJiuZXyvZ6p+Wk42l32ysDGlA4hDwk4JMgOnXMmktZqiyg/3ShJnTyhuBOosd3OYNjjuJ6/DB3Ekd67PItrF98xeJUNo2s6jqj14eGSCzltTGeDsPYwN3PHZq08=

Alexey - thanks, that's a real point I hadn't considered: if EXLAT is
deliberately inflated to keep Windows on ps3, the 100ms default isn't a bug,
it's aligned with what vendors actually tuned for.

The measurement itself I think still holds - it's reading what the drive's
live APST table targets, not just trusting the label, and the wake cost at
ps4 was real regardless of why 43ms is the number on the tin. But that's a
different question from whether Linux should default away from it.

What's the OEM precedent you mentioned - did lowering the bound before break
something specific, or was it more general pushback? Trying to understand if
this needs to stay a boot-time opt-in (which it already is via
default_ps_max_latency_us) rather than ever being a compiled default, on any
hardware.

Also - sorry for the fourth copy of this patch landing in your inbox on the
28th. That was a bookkeeping failure on my end, not a deliberate re-post; it
went out after your reply had already arrived and should not have.

Cheers,
Ferran
