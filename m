Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794263433;
	b=ANNhLX5Gkiw3GXQyaBgNrF5hSrEnLNxgb5mdU0II6Qerw+DTWK3PNTokqM4/+wX2pH5y
	 01DBKteDTthzwIRD+LQeqB61Eb8XLMo+3MsK9THgMJxOGRUIqnNm3HE2p9crXu51FdpcF
	 TGbSPQWw98f+mrdyHZL67FBt7HrWz+Wp3fSPEiVvVk6WfrmejaI+O+XkQKllDQrIyCgzO
	 Uqk5DVMBq3vUCvNPWWNpB91Lx60BR21TkYFfnLwKDSrpBd4Kb16KaU/W3DlrGZ+RhUZe4
	 AtcPcmmREPcZvDfXUkOV22gR2EZbpOnE5F4NKkacrV+5b+FmO0R58YNHr0KLA7DyEJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263433;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=A3/tX5Js/EQc5Bx1i87PU/tdcMaCJa9fE4LFfvSfHdU=;
	b=kAEe2fcEuqLAjdzno95Twk1MDpFqVgQksE2aqcAL6X1Rjg7XFE7h4SXQr52Nm/n1AF7Q
	 6NNdUSAz0Jz+UdmH8gu7MPkREUiQF5WTxkDmZcfNSohAVKiJIwcUTzFD/lU6AJf4WWfiV
	 CNmoL0YZcOP8Q13vlxJAwJx53kFlZ7PJ32mhi7ByzgOBCnyr3GtcaJiQ9h9cfIC0X5hTb
	 Yf6E+EtfrnkRLJh6i1Q0OBDAWD7jPCPk5pM+0bdm8AWPi7kWrL51bOSLZLECZOhF9JhAs
	 wrRGdwyvGdcqv9YHEsVE9IBm4RqxUX8kXgVGl76MOPPVTyPxozI/SP/KiC4O/PDjWKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=QLgR2+d2;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE91E606A32A;
	Mon,  9 Nov 2026 22:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE91E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=QLgR2+d2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1794263429; x=1794868229; i=arc@gmx.li;
	bh=A3/tX5Js/EQc5Bx1i87PU/tdcMaCJa9fE4LFfvSfHdU=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QLgR2+d2AK8bYD3OGshx6jYcasqVlzwdy0uV/5wrcO12ydcJY+cL7PwTmFhSycgT
	 K9Di4LeOfTVDXG2HhwoxYjoRIoT3JMJbmOG7WMqZN2K3+gCfdKksDo4kwBKeZBhAd
	 jzq483DePyKU5P0KW10B0m+7583Jpb4ENYwTJXOCDaTGMKKOPYbqSX/BnieJMo7eK
	 XlOl68Kst1pWUzg1IQzU7vW42UyKveuVSgteibfrkx3evnBxrXu4PTq0kQbSMVKWR
	 uUcRZldmiYD8s7XjWbgpI2uTX254eaNTbMwTRLX9DTehchfqXDXSExiKb96o9APqE
	 PGvOr1s+ghvcfqcMSg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1wlv-1wTW9c1cHx-00ws2K; Mon, 09
 Nov 2026 23:30:29 +0100
Date: Mon, 9 Nov 2026 23:30:28 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: Re: [RFC PATCH 13/16] ALSA: mixer_audient: Add enumerated controls
Message-ID: <avJJgGbAVnVrUlPM@khmer.arcnet>
References: <sashiko-outbox-201869@kernel.org>
 <20261106202943.1034941-1-mrwillporter@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="92xufW9v+mMevMAY"
Content-Disposition: inline
In-Reply-To: <20261106202943.1034941-1-mrwillporter@gmail.com>
X-Provags-ID: V03:K1:nlnjFu/zCLpQVoomO768MNLuvxZ6NMEiTw9Q3yXSRWzW7BTL7MJ
 6Sf5+/VqegqAjrpVMYBULTBEm0uovi8bnNLJtD2yRkw8XEUjxvXJyRxW+3rIqh9MXofN0Vr
 7uopw1Ymb8q2zEpZcQZjUUXxgefDkUEK1cWUt2lOpB4pcsJIfu5qE5u/AFnVwmRvlRXui+1
 Xndtvti2/r5DHgNs43ilg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/fYI/Hy5Mrc=;vQI6E0j+JOfONd9cYzlEWJ4NmxY
 PBCLxOV4bJlHiCgMpwDTFN3GXVOKdBM18YK6ey5vUvtQuPB8hJqc24c7Qla0L+ZclHDcEb+DA
 LbvcCrywyDNGYhs3VsVOLBO6mArtvpz8SQu3VLNRT3BzPl9+L6I+GwvYfo70bkugDNS+JMk6c
 btBBcJffBn71T5BLDJbVT1Ky3CIrcsQlJufVM6krJX42uB7fEsCQo71GWCcUmvmVPaLwUfu+g
 0zzmD77eMutpIkD7WPcQM4D8IzpFLwsnn9I13ItcrGa3dAMMXwCxwb55qRnLQYzVOlWWLPuVv
 dfEx+iFop3qZhbgnlAOR7lvOTR6bchTbQZ9zYV+jlPYaBnGi/ESN4A7olhbFmY+p3HMV7AEmO
 ngELyZg8ODZq3AidNLOpOGC1o5hh/aSxiQobhL8dDNoXqi6xfIeJehJUjbz7jI+Lhfhiode7d
 80eGRF9+60aIUFpCINy3ExoD0vLB8M9xB/dCLAOPM1qpuBhEhMQoWeHWeVInPmj2lki0jjK2t
 tuSeJO2x8sxulE2K8KdU0SMCgikczW15r5j3HGBDbZo9dj0cr9JZokpbxP0JgvM4NpxjPxB3T
 4pj1lL+sYdqh9A41YgKN52lXOssBa/Vc1UDaZz6qnGmzNelHvZg3/FZnyFA4zf60xQYsXm1Ve
 sHBCINknJ5uYjy2BmrOr4JYlXU+rwzBoKV5YsYgjsAo7x9ZfbQMxqAtEaOUlboEyr4Jy2L9MP
 C5hheABUpSbgmaAQtvSorEHVuy2QnlDghLUfX4Cisi9rM8vSKHnhdVSyMNrV/6raC0LjKCevI
 u0zZ334Le+kMhRvpREKhYgHpJrTZHISlsTjf8z8lHLF66seq1dZDG8EuNrHi4TYIv3xlugfH2
 2Df31PntHayC/xFogRncXHsV36U21MRHOMW6jw8cR9nREYvMvTFh/12/XP3peXY7ZGQKWZ5m/
 8aw+VzJzUfWZz3jMqqGNpmUYiL62jzh/WcDtvV6erJkrVYgiU8a+NBHRoTPXUvyW3AZq/OwRp
 Mx6VWd/BkD0YHGBwuWZZb2pVbDrTg03PutaJUOR2UWvLIJIbXLP8J9nnzEXyOk4qoVS/a2WfM
 NlLI5WyuhoeNd3YJX/1QzV7GqLhCGhJQ2lDNtd/LHn0FY3Ixb/Voul/mSgLI/1DkFHNyzZcEV
 w4HE1KnJuVwL5QbU20011Zo0Vxu2MmMCntCztOfzI6+B53+GqLtRieOmICJq2cw8SJxIvM54B
 pBc6ZPtHiWzSS8cHbTjbundZtiJYFZ9ICDs1ij54MXniReqB9vnAjWZWA3BoB4J6KHm8bxJVG
 WcR/53Ow+AG9hdKugDLM3irSv8J88GScTOztAd5OXCm0zuhJ8UocvrMC9/EQ5gMXK7ixRRmyV
 g4BKEy2nw/xrSDVs3/99yj166CgB11ABcCgExPDV7IDqG4AFaEuyzip7yAgSn2n6F3XbF/urE
 oWwDpNUD53PWIMv42RfJ0Id2WXm+aCuruLmPJ9BP+AunBFFDQ6Ir22KSH+h3oSNlvv4Ai4IF8
 TWYfHjnRgztfyo+jQeDQWGQuAY7tKPTlgXfzcQpP6YHaTiz4fmN2XZic90r/ZR6IQNVCRhMZW
 qE0loByWyq3V2ZL2Riucnv/DfpF8Re9wL3x2WFph2GxkvysdL7MdD0aMK53iDVWcjn6NYbafk
 qzVCgNjZm/XE4RJxgR+BgBc3E+sYWyVJcX5AoQeqejuQSNoAZ3BiEmaXreb0JWmaRE/AaNPkU
 pYyrI/KZy2F/VcviDGJ0fg/8fvTniy1/4p/mR8UmFJ1i98FbUiKoDcogqy7EpP2ihVRUwluo3
 yhkHrhfxUMF37BJggPNWEcZCzCD5yDNowIafqWKJ32kyzqR7jXKM99vm0mrGlkNUcpDhYS2p8
 cN1Ox3q9g/mgtJh0b0bkutHO/mxeka6Su1rvUAPn9Az9kCfzpRk+BB+WirLpqCxYt1l7JJffh
 VBn5L0KuYL0YZVw7WzjOxkLMsn5+2T9r+pl5fbcu/KrnnUOhSGqfk6DpJN8a7hFGgPopodO1z
 DCRjT+FRWtzJDv3yOk/N86RDVe77uXGAsXm4Ob542Y9dqWmulYg4HaAvoAwgQAsU/2ncGssIj
 ZIvJ1uJQZHecvnaBfaStXPf2uG7gqPAB7WWYugLWr9WOf8FVFjGZ6OLRHCbwOwPE3JS1Vq3vv
 aQ3j0XcB/ZmHn9QXtWBIkW0DtvBPFchgGxpxMurAEm/WHplbmeG0rofBYDzS3wgMjc/k/UZIV
 zQGQRRkseOOfi4TamfV8IbgyFp6oSmkKm16jjfA9ri8iFrK3JgRomHRBqVxLCiZQGRXM9vakP
 Cldz6uRY3dRg6RPJ+PUtPJ6Kh8aCTMRk5VkFRoTsDNCaFBYr4pgsitsM0NWWMmPXTrTYH43LQ
 RlDXgn/HA8UqJC41vggpJmEPLmsESHfhX3b/MXdMF0R2Of927qPBDtnsXlZWMMshk92n+qCBM
 bw9mszFWiJTfgZdHw56tuYT9wAgp+pKjGbN35hJtbyfi8Ql6L+WJL2g2msb+2DekCaH9pMDW4
 srr82PLJOxqr17Xe6vWnG3rdRTPy/JkwjS0sg4gC0lOsTf2kEH343TNYGd3UjnAn7O2P46m+E
 IGK+lH+gbZg6GOzFe9ofl3qQdixEBj9QUyy5pkDW2LoLKmd/TSF6VaJQVvrEj5/MWgOCxD/aH
 RT8LYG/dTpmWBqaYo9vZkTqBbOR1oHFZ2GqHPSDi76NumJg4mV2BTGOsR+SLq2ofQdDa5dp4C
 mOa4k3gFq8fNGlUBl5OU3kUzuy1b1VQzTzkxfMCkrRU40kJ+wnDIJ6n3MzWws6epj2Q6xJbu9
 afjaBz4AeXXTYbYpi95HanFwT77T1UIfjEKSEP9nQqgFip3kTiHazrHVwMpBONkMfuht/sbsv
 JTHCppauuOS6RxjMN5jTG9WDpgLLviH9lqr7G7JQmlhCBPbUPkpY9pgAb6hBNbH9D3vdgNgaT
 7GyI92ik9wKUzyV+mq6lnIdkBKx8OHkN8t4IzgGLBciwMyJkA2hh5dyPjYjNFfioGv3gWuS9R
 Mdg6/REYSK8JZCfakfBfAIHTi7o0ECfi5CX3iW5I+EsO2ji5RIAYBh+NTfwRljUSczWQFYnTK
 LQOQQqo/N7cAZ7paLdbHkD2S/Zez8U/RK/1DkseuUcLKYdCdUZAKsPDWI5R87FQdqKcZnPFgj
 9V1RdJqINgZF2wGk3yjgf937YgWd/DTB2HOHG+COGbQ2sPyY03gDBbHk1w9uuJRgjGovPlt8U
 cgMRVK5TGXpbKNkFtg0OMPJd92/Zf92PEUGtRSxuJb7+7eeFuTkrVw/Tw+YKwPGPZLVZjFIMz
 kvNUyndu5Ou1YCJI2l+m3eO7xKJkA+Uwu4pDwbrtWgWnH+sc1obB5xUNp2fWeloZDav/TxEsQ
 kn2JTztGc375DSPcZtPu44DQ2SQJif//RTpYnN7sxXayNMj50SkI4WkqOTGoN0MGMc7YUC3gN
 pdSn9O2h0IpC8KdRLWtbH6VlJ5prahK8ViOx8RDzcOjb/yTG5lzJ4hv7TzJ1j23srrYxgEhO1
 L1cMSEyCBhIOREsJtdJtD63h+R1Sr86sFx5AADwaCX5jgtXddLp0iWgK36V09pVbGt8GoZ6AE
 Hu/tXFZ7vAOyAiJxqCWydgp8i0IdwOvJyypnkb+LDw86E1JOj7CRWyg7T3e/xGJz9lNWWyB+4
 Bd5hZW+zjcIjqklNMXNs4c8wj1t18YdbanEcCxvGTbUQTwBycQsx7tc2DWQpj3U+dOXkf3gkN
 ZWFyTj3zy2CafBtHVoCmkiMK9Hcln1dd6U3/Y0CBOfDCEfoTLPvEQXWSFrsa0C5d+hmifCC8+
 mdjp3sNurOGMOWKW04zbzI0RxdVar3VU9kICjak/k39d5U38iUPJFXM9jVLCiMqsMwnfjhBT4
 isxvNGLAFWji1awWIuVDemf29E/tbFPOFhJC263sT7aAdsodAwmaZQ2tG2lBulGgHrWWNOekh
 vlS4vjsccYHc2wDzY77dm7QSJvygaoMsc3yIuWNdv1BfW4fV3SN0DFN9zt/ZBN8+mNK41G51k
 So/bH7NYq5pMVQOBcVgwdVE/jQgaPChUAv38gwkWclaINZsCQsCBDbeeuVSxH0wCLcAbukF6k
 3cmq+c9CTcZ3D9DUej7PAIwN2yCIcRDj+lp/CMTVyvTDWuDCCSVDYijxDevchaBxEVpuKH340
 w2y2vdUy/QXYbUc/nad99jsOr1lPz20KpBCylJdJRfCU0DlsLR5jG/YkXvtBkyQSiR/sWVtLi
 NyVrqGJqO8h5j2k9BVDYyYUgj96CrbthiTmnM88anVjVohM7qn89uWiTN29ZUTaECWEehznjW
 nU0AVfwn9EfQfZA0cg5GEqs7Ctyc7ovX5eB3zRzueRSkJNBcsUtHbpGxs44KDdnxHgPvVj+Jr
 /FAnh7G+mlz9TtVqQZTdAYiReaF4LP+/EH/JUMnBuDc3Riph0lO20prXOjIrBR+NpF5eBlHzB
 d4gyBLP7VIztxsdvixvMskBbzWX7DM7BOpWsb9ZQJIhLoVex1xu0ccMZodQmHcbVR2A9Pmbaf
 oxLNpk+pv03zxSt1AO54KuvbOK4KMIP2BmT/m5ZyCaw4a+QhE4/TA9hLRF69dfdoWsjyJOa80
 7R4qGie7QZfJMzBsUA3l/Qr6FtUwlKJJjzyPgpBj87jckCyS1+xeoIDJUF4NAQ57KZtwOls5y
 kf6yzwPCNA2GiIuHTqIVXEsaRVpaSJ4ZRjleBOA2Vn1jIFxnt54hhoiGidZwxmfIVFWd3uD17
 IzWEzMgXLG25qN4TvV3sas7NRwV1CzP0VHEp/vPlyc7EaTyNF+dAoakK5u8tPdaYAT+yb2JjE
 IEp8+W89ZeOib/CNUayJuGYG0IINmFXYss2End88YKEjNIhe1wZ1xd9sJ3buOCFqK5+DtHp/2
 7fmPiwggpuQlapHyeXMc3GtnNIbQgMHQTonZ4U9bAdVnBabGMKwzdhtGOPpiIHTy+SOJUDxrA
 hxZy06U+fr1WyJbdtWTV16uW2t11fc5mlvv3G7YGbVYXR2F5Rc9SLAqQ7os0ijDpwe38VBPZR
 jKneCegFePqDJYy7iU19fP1iOu3AZ0fFDMG6adMBNKlyUkQE+RzpALeAJCy+/wNeL4pRFwPmr
 u2fpUvifIaW7AYboNBvhXbOf+ftNLC23WEk4QNFvGrgvJRXfc/sroLD8hGtMbSAX09qzHJkkX
 zXt6JjbYpuOZ2xEL5FwpL19lMPcAzf0kYrycnssdBeQlBk2wD4gGr6ckAPFD503tnoP7A/LjG
 APoK3KLfNY1GVIE4Bv4VVnhOHUVARVjvlJ/AJ+lrJvAqCZlEmeqAkH9E1lO2AIr5FuSHdLng6
 TL8aWhSLwic1Imisc54HRF4WAnQo1h7by+kCPyYoJoIuD0qV1zOGtsqgvxl/oYEpnkbbMrTcr
 fK7AymCYF7MeZVhEJT7oH4cQMOCUN6RGzWzWt6f6oxzcDDUljBTfYdASEPKdYAIXE8+Y4Eqwm
 K6ysNXZr+LhGws9BBA76JZIYpqmyX2roYWwX8aQJudq++tmlJQKYN7ttcHtWnUVP9t4y0IKsk
 mKeMJHyrRGi1OhyktEvPzG9jwsBqspKfcEXuvV2jUSIu6EzynnhgEWIGZ0yfdHNfxyRDiXt7N
 rkZYZf7dkM/V6lqxTWfiTUiEgzYnVxLzMOn90G26oqKe3NvJNXNVPxOwEIhB5r8uIw1GE4tbK
 7Syw06uLZlEeIyyuHXNGoKr/4I1clHsBC/EHUawRubC+g0EroCerGqAiquukv/pwn9nzDW3Zh
 SOMnmRYKi9OgqCBM1TI6rD1TnURY+Szn8gXS9jvHzZlseASCCcdev+pTFP5XKUPQnRnLVoT/V
 X2vhkTCUzH+AWxEs6Fbm6wcM1iYNLNWozeGTJFt1RlEKTv1Kta0mi8iPmL4w3b37hrks4Vrgd
 mIig7in8OLPE5QIfMfQiYKQBm4JC8mJJXfxXIsZF3F3amzMCEfPKBHJ23VhuFRUx8FoRVvJlc
 GiyAghYUxwethHAZI4oOeR9XIBrWi7GMuningELX85V5q+/MSOxJqCLw87Ca3xwwuECWFj5Sk
 wXjRH0FihCCLPzaZkQX+fYWcSmt5tapedqpc4BYkJcPkN2vKApgoDIcbgUu34qzL168gf8huR
 Mc0B26FD0mEmLofbelLyVslnqoSHeHqlkH4AU8O8M8Y+3x0+jnJjPcYoaN7tp37NBIqFZQl6Z
 2Qk3lAEY2QM1HtaWAioJ0dQBRv+clYl1vfCgqVuBvh+etLEl+wmX5pL8K8hi/kDomF+M0SjVR
 DVD6vb+lUb1omGQBfQbvL0JRp0pSGuFR4X2l5GpS/hlpO5kM19pkyFO7XElGXk1dvvdlZUhIa
 bFp4zuQd2AnGfdbJexS3Wwot417ALMzrwlgV2WOZe9Snuk1pqUjSw6ikAl2sZBziWCw7MO2kY
 f+CESXO1wpt7L9ypyb6ggoWnm+2xMtJWjdH+D6nrdBElqLbO7L86t1kLsL9w8P45OIx6qwgft
 T4Zf6jdIjBxE/MlEwrFP05AR5GLyhaNr94t6Qpn7BLbXD/95+sY0Aq4jVTWmm+EQ0IZBEjjPY
 uKqjhMLG5Q30mUyolZYhuy+17LurBnll0Oh7jEj8O7FOd2J9qV2069VoDEeGCsPiLq3MbYGNi
 s//y5G5YQTzLEXntJaDXs4HMAZY1mY/gDMCOcH9yhKDlXdJpkyzgkkCkyVzWJarsD//6GW3+M
 uf0Tyasqg6yxxvr/0LwUp2oVo9kx+wDXGIUznmcZqncG5k0qAb8BETGbxZB9mQ7bv8sj7av6t
 NmKkPnU0Kkri/LsvWuXVk00E1+4/s7a9HoK6GlZORYgV0TaUQtBPa2iybIXs/vNcBT2p+oX/I
 2gTLcX82BvNYfFRnAXvKKTWw+capz/8BW2zZIhf1Q3j+cayZ5PfCpmQBhojWk6XDE9uzSsXKC
 jsVZ4kYWKarnJomzF3WKAoBkWDSxdNuPb+K9hPzWkchy4MfqvaYbRqAsZw81HXFUC/KCdKKVX
 fv6r9kmWlCEvJiyJbpmEkXLRTZyyfgXutHK8eLL7N+RvzufTVRrBOsnzFCatSDcVIuI4iO3js
 tsKPOUFaLM/BiNcVJonCmX32KwoBq5juGg0sMkrRHkNc3MgYlcvOWNlvC2pN0LIT5J2yvCLl6
 DJdBMRXo1u9+fe5HQfDlokjvHbgFwOuwXUZBF6+iZAAvQqgitFCL/LVRgaMXYCwNLncpW0Wz2
 jYxgTXNfD7H1HkF/HetMcUUY1hv1K41RCSYTho0Tey/SJxiRnOjt9N+83/QV6DNTN+Z18ldRx
 SkgcGd2JaxTyJDfqydsyRG3tyB8D9x2PtBTg5SGtc3+t7hwl1nw7YIhO5a6a6CptW9I+Ng9Sy
 Sy7JjN+Ut6Xpe8rSMSYyGgVbMD1WMXB7WVEhGApuxZm8XO5h/lBdTMkvI6LzNBRXiC0YRGxLB
 0EZl3V2pHYOJmAJgnuV59JlMmgtWAf+VJA4WkNW9wmaowYQlCQh25Y4eQCWy4y6R480u0gTwL
 ZS5cWjCMETVaTsghlSzGhEvvo5guh418SyUK7lJ08kp6CfxzUPVCftouuzfOMkIMEMzi+Uqg8
 ELaxuR5GrQ==

--92xufW9v+mMevMAY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Will,

Thanks for this update. I squashed it into patches 13 and 15 before
reviewing. I also tested everything on 7.3.3 and could not find any
issues. Here are my comments about the code, most of them are minor:

patch 12:
- I would declare snd_audient_int_max, snd_audient_int_min and
  snd_audient_int_from_ctl as inline, they are little more than macros.

patch 13:
- I would have snd_audient_enum_item return the negative errno instead of
  e->items and then propagate it. This seems more coherent with the
  convention applied almost everywhere else in the kernel.
- I wonder if it would make the code more readable if we refactor all the
  if-statements snd_ctl_audient_info has grown into something like DIFF 1
  below?

patch 15:
- snd_ctl_audient_enum_get uses ctype->init which is not set by the
  ID14_ENUM() macro. Is this intentionally always constant 0? In this
  case, could the logic be removed?
- Not sure if this is relevant for the iD14 but we might want to apply
  something like DIFF 2 to make update events work on the replaced
  controls 11 and possibly 60 (in case somebody fiddles with the buttons,
  please check if it actually works with the device). BTW: I'll see if we
  can somehow also get update events for the new controls of the EVO4 on
  the occasion. The events the generic mixer driver generates don't work
  for those so I didn't bother initializing the ID until now.
- In mixer_quirks.c: Fallthrough case statements seem to be used almost
  everywhere else, I suggest to replace the repeating call to
  snd_audient_controls_create with a fallthrough as well.

patch 16:
- can we rename 'create' to something which makes it obvious from the name
  that the callback is optional, e.g. 'extra_init' or similar?

  Christian

---- DIFF 1 ----
diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 4180d7d8b325..212a2156087c 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -1002,22 +1002,25 @@ static int snd_ctl_audient_info(struct snd_kcontrol=
 *kctl,
 	const struct snd_audient_ctrl_type *const ctype
 						=3D snd_audient_kctl_type(kctl);
=20
-	if (ctype->type =3D=3D SNDRV_CTL_ELEM_TYPE_ENUMERATED)
-		return snd_ctl_enum_info(uinfo, snd_audient_kctl_channels(kctl),
-					 ctype->enumeration->items,
-					 ctype->enumeration->texts);
+	switch (ctype->type) {
+		case SNDRV_CTL_ELEM_TYPE_ENUMERATED:
+			return snd_ctl_enum_info(uinfo,
+					snd_audient_kctl_channels(kctl),
+					ctype->enumeration->items,
+					ctype->enumeration->texts);
+		case SNDRV_CTL_ELEM_TYPE_BOOLEAN:
+			uinfo->value.integer.min =3D 0;
+			uinfo->value.integer.max =3D 1;
+			break;
+		default:
+			uinfo->value.integer.min =3D snd_audient_int_min(ctype);
+			uinfo->value.integer.max =3D snd_audient_int_max(ctype);
+			break;
+	}
=20
 	uinfo->type =3D ctype->type;
 	uinfo->count =3D snd_audient_kctl_channels(kctl);
=20
-	if (ctype->type =3D=3D SNDRV_CTL_ELEM_TYPE_BOOLEAN) {
-		uinfo->value.integer.min =3D 0;
-		uinfo->value.integer.max =3D 1;
-	} else {
-		uinfo->value.integer.min =3D snd_audient_int_min(ctype);
-		uinfo->value.integer.max =3D snd_audient_int_max(ctype);
-	}
-
 	return 0;
 }
=20

---- DIFF 2 ----
diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -1083,6 +1083,7 @@ static int snd_audient_add_ctrl(struct usb_mixer_inte=
rface *mixer,
                return -ENOMEM;
=20
        elem->head.mixer =3D mixer;
+       elem->head.id =3D ctype->unit;
        elem->channels =3D ctrl->channels;
=20
        if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_CACHE)






On Fri, Nov 06, 2026 at 02:29:43PM -0600, Will Porter wrote:
> Hi Christian,
>=20
> The bot found a real problem in my patch 13:
>=20
> > Does advertising ctype->enumeration->items + 1 items in
> > snd_ctl_audient_info() while rejecting item index e->items with
> > -EINVAL in snd_ctl_audient_enum_set() break the ALSA control UAPI
> > contract for writable enumerated controls?
>=20
> Yes. mixer-test writes every advertised item, and alsactl restore
> fails on a value that store saved as the extra item.
>=20
> The diff below drops the extra item from every enum:
>=20
> - A device value outside the list makes get return -EIO. I chose an
>   error over a fallback item: an unknown routing value shown as Main
>   Mix could hide a route that bypasses the speaker volume, cut and
>   dim. The device is not known to report such a value.
> - A write-only value that no transfer has confirmed (only after a
>   failed probe write) reads as its init value, as a write-only switch
>   reads off.
>=20
> Tested on the iD14 (stable 7.2.15) with the diff applied, with a
> script that does the enum writes of mixer-test on this card only:
> get returned every advertised item after its put (from the cache for
> the write-only controls), and the item past the end was rejected.
> alsactl store and restore of the card succeeded. I did not run the
> full mixer-test, because it writes the controls of every card.
>=20
> Does -EIO from get look right to you here? If the diff looks good,
> I'll fold it into patches 13 and 15 in the next version.
>=20
> Thanks,
> Will
>=20
> -- >8 --
> From: Will Porter <mrwillporter@gmail.com>
> Subject: [RFC PATCH] ALSA: mixer_audient: Advertise only selectable enum =
items
>=20
> Every enumerated control advertised one item more than a put accepts.
> mixer-test writes every advertised item, and alsactl restore fails on
> a stored value of that item. Advertise only the real items.
>=20
> A get of a device value outside the list now returns -EIO: an unknown
> routing value shown as Main Mix could hide a route that bypasses the
> speaker volume, cut and dim. After a failed probe write, a write-only
> value reads as its init value; this does not confirm the device
> state.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Will Porter <mrwillporter@gmail.com>
> ---
> Proposed change to patches 13 and 15.
>=20
>  sound/usb/mixer_audient.c | 41 +++++++++++++++++++----------------------
>  1 file changed, 19 insertions(+), 22 deletions(-)
>=20
> diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
> index e65c62e1eac4a..4180d7d8b325c 100644
> --- a/sound/usb/mixer_audient.c
> +++ b/sound/usb/mixer_audient.c
> @@ -67,10 +67,8 @@ static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tl=
v_mixer, -12800, 600);
>  #define SND_AUDIENT_CTYPE_FLAGS_CACHE		BIT(3)
> =20
>  /*
> - * An enumerated control: item i sends values[i]. The texts have one item
> - * more than the values. A put cannot select that last item: a get shows=
 it
> - * for a device value outside the list ("Other"), or for a write-only va=
lue
> - * that no write has confirmed ("Unknown").
> + * An enumerated control: item i sends values[i]. A get of a device value
> + * outside the list returns -EIO; it does not show a wrong item.
>   */
>  struct snd_audient_enum {
>  	const char *const *texts;
> @@ -85,7 +83,7 @@ struct snd_audient_enum {
>  		.values =3D name##_values,				\
>  		.items =3D ARRAY_SIZE(name##_values),			\
>  	};								\
> -	static_assert(ARRAY_SIZE(texts_) =3D=3D ARRAY_SIZE(name##_values) + 1)
> +	static_assert(ARRAY_SIZE(texts_) =3D=3D ARRAY_SIZE(name##_values))
> =20
>  /*
>   * iD14 MkI units. The monitor controller, output routing, headphone lev=
el,
> @@ -126,7 +124,7 @@ static const DECLARE_TLV_DB_SCALE(snd_audient_tlv_id1=
4_vol, -12800, 100, 0);
> =20
>  /* Mono mode: one-speaker sum (Left, Right) or phantom centre */
>  static const char *const snd_audient_id14_mono_mode_texts[] =3D {
> -	"Left", "Centre", "Right", "Other",
> +	"Left", "Centre", "Right",
>  };
>  SND_AUDIENT_ENUM(snd_audient_id14_mono_mode,
>  		 snd_audient_id14_mono_mode_texts, 1, 0, 2);
> @@ -139,10 +137,10 @@ SND_AUDIENT_ENUM(snd_audient_id14_mono_mode,
>   * mute still act on every headphone source.
>   */
>  static const char *const snd_audient_id14_route_main_texts[] =3D {
> -	"Main Mix", "Cue Mix", "DAW Thru (full scale)", "Other",
> +	"Main Mix", "Cue Mix", "DAW Thru (full scale)",
>  };
>  static const char *const snd_audient_id14_route_hp_texts[] =3D {
> -	"Main Mix", "Cue Mix", "DAW Thru", "Other",
> +	"Main Mix", "Cue Mix", "DAW Thru",
>  };
>  SND_AUDIENT_ENUM(snd_audient_id14_route_main_l,
>  		 snd_audient_id14_route_main_texts, 0x14, 0x10, 0x00);
> @@ -156,12 +154,10 @@ SND_AUDIENT_ENUM(snd_audient_id14_route_hp_r,
>  /*
>   * iD key function: the value is the monitor controller selector the key
>   * toggles. ScrollControl (0xffff) toggles nothing: the knob then scrolls
> - * through the HID interface. The last item of a write-only enum shows a
> - * value that is not known.
> + * through the HID interface.
>   */
>  static const char *const snd_audient_id14_id_key_texts[] =3D {
>  	"ScrollControl", "Mono", "Mono + Polarity", "Dim", "Talkback",
> -	"Unknown",
>  };
>  SND_AUDIENT_ENUM(snd_audient_id14_id_key, snd_audient_id14_id_key_texts,
>  		 0xffff, ID14_MON_MONO, ID14_MON_POLARITY, ID14_MON_DIM,
> @@ -170,13 +166,13 @@ SND_AUDIENT_ENUM(snd_audient_id14_id_key, snd_audie=
nt_id14_id_key_texts,
>  /* Talkback source: the routing source number of the input; none =3D 0xf=
f */
>  static const char *const snd_audient_id14_talkback_texts[] =3D {
>  	"None", "Mic 1", "Mic 2", "Digi 1", "Digi 2", "Digi 3", "Digi 4",
> -	"Digi 5", "Digi 6", "Digi 7", "Digi 8", "Unknown",
> +	"Digi 5", "Digi 6", "Digi 7", "Digi 8",
>  };
>  SND_AUDIENT_ENUM(snd_audient_id14_talkback, snd_audient_id14_talkback_te=
xts,
>  		 0xff, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13);
> =20
>  static const char *const snd_audient_id14_optical_texts[] =3D {
> -	"ADAT", "S/PDIF", "Unknown",
> +	"ADAT", "S/PDIF",
>  };
>  SND_AUDIENT_ENUM(snd_audient_id14_optical, snd_audient_id14_optical_text=
s,
>  		 0, 1);
> @@ -933,22 +929,23 @@ static int snd_ctl_audient_enum_get(struct snd_kcon=
trol *kctl,
>  	guard(mutex)(&mixer->lock);
> =20
>  	for (i =3D 0; i < hwchan; i++) {
> +		unsigned int item;
>  		u32 val;
>  		int ret;
> =20
>  		ret =3D snd_audient_raw_get_one(mixer, ctype,
>  					      snd_audient_cache_slot(elem, i),
>  					      base + i, &val);
> -		if (ret =3D=3D -ENODATA) {	/* unknown write-only value */
> -			ctl_val->value.enumerated.item[i] =3D
> -				ctype->enumeration->items;
> -			continue;
> -		} else if (ret < 0) {
> +		if (ret =3D=3D -ENODATA)	/* unknown write-only value: init */
> +			val =3D ctype->init;
> +		else if (ret < 0)
>  			return ret;
> -		}
> =20
> -		ctl_val->value.enumerated.item[i] =3D
> -			snd_audient_enum_item(ctype->enumeration, val);
> +		item =3D snd_audient_enum_item(ctype->enumeration, val);
> +		if (item >=3D ctype->enumeration->items)
> +			return -EIO;
> +
> +		ctl_val->value.enumerated.item[i] =3D item;
>  	}
> =20
>  	for (; i < nchan; i++)
> @@ -1007,7 +1004,7 @@ static int snd_ctl_audient_info(struct snd_kcontrol=
 *kctl,
> =20
>  	if (ctype->type =3D=3D SNDRV_CTL_ELEM_TYPE_ENUMERATED)
>  		return snd_ctl_enum_info(uinfo, snd_audient_kctl_channels(kctl),
> -					 ctype->enumeration->items + 1,
> +					 ctype->enumeration->items,
>  					 ctype->enumeration->texts);
> =20
>  	uinfo->type =3D ctype->type;

--=20
  Christian Ruppert                                             <arc@gmx.li>

This message is digitally signed with GnuPG.
GPG/PGP Key fingerprint =3D 4492 2196 75F0 EAA0 981E  B661 1476 F17A 975F 5=
87B

--92xufW9v+mMevMAY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJPBAEBCAA5FiEERJIhlnXw6qCYHrZhFHbxepdfWHsFAmrySYAbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEBR28XqXX1h7zfsQAI2P7ZAZSUw4pMqBM5sr
yiOC5y1R1wxUrPLYzSrNE3v+VFVjIL0D8Azn1mKWvkxI0rQbPI4EKV8/RTB2YrM+
19s2raeTrJZBp4FsMfzcX/mSrhOX4K7n/8A4ySzHbW5BOMYdP9Y99tojClLPMzoi
zFZb0gGTxJILJoHZqwdtMo6aT3LenaOKth32WW4blxxnt0yA9Gbtl2u7kwE+0yP+
N1vhkyBdLemGWgzsj3D1Z65MP9yjfPNF4LA0j+CA5VHZZ+BEyBplOvtIufHZSnAK
DgnvcKahBWGNQTL0kmScd0SMlPGGISNfWxTvISTa14UTvLxUQ2YDej0xonaeQiSY
fKOyeaQvflMbaN8Kta9Hm4JDTFavFjJ0/uNz8Mfp/P6l/YY36VLxbEbCAi2qdqul
PAMSQUN5pZiczVaw9ksQuPR7wzm03C0c40AG2GHEIMScl2gV6lZcM5d3yYj8bmuH
5c+/8OTf5VgvYxobLLnisxDgjf7So2fjZQTEnc+Ua5RH6en/emk/NzvOqpkGM3Ks
uR5tpuKNfG9UR9fatqiWExVCPnqWDiWbZNSxtfiUYf+qosyYk6ew+69ncutJ/M4J
6OJb3t2FN52mRbJfPkfMbcj6XudBvyZVajJRi/O1KhzTZRxpI/Y76gUzttUdohEh
YlQoExY9+ZrrRmeZG8Ey93wS
=QYac
-----END PGP SIGNATURE-----

--92xufW9v+mMevMAY--
