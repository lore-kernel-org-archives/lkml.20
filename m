Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039789;
	b=Es+ozFoX8/6D8lJ3Lsmuu2Ezq56+EqSrkyzwvv8Es3rjxTZSKPcJPa7SfagdvpfR+AHB
	 q1bbwsJGubFp/aYNaP2ewjWaQqL0/JCpUa32frXNMBF37RlijlfDJ01kwg0+WL28rTON2
	 IClcJN4B+3gPu4pVdIXR5gCE3YQczbdlvg9auezNhPc3JKcUE+FgLbNgNWzYpOfIRHlE2
	 Gth9eB5krLzTihsuyc1CAvt6ENBOeDiCVXp1jgxFjc+8w1LffNYDdkwKsDKklmEEhxuKO
	 hSUOxTS2/Ia1Lzbey+uceV/xPzrT2DYgl2ZhiWKlRyDvEzFE1jk+kqUdVOcFWH3O/4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039789;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=RvWsL8xJkBCO4yxQJRV0O8eJ+YSl1IPaJ9q/D8RQkEI=;
	b=Z5eY/4zAqLtm5KZXP6szAs3Mcmfh8Kh/tH2jSjn0IcyYkLAIyDfTiW5CGSxIdkim0PI5
	 BFgWpdZgufuUYE0qE9n28VqQdqoPdzGxgXO/9l+IXOtRJN3aMA4eDJAKC8tjnC/ytLeHu
	 sXPdC4Fqx27X/tn44x+HT74C7HkDXP6VnXRl9axrWFhB2T+HxDtbLK1QDl33IGPhLkhda
	 TbCjZxLjCP8QX+FmZW0oaIel6acPm7kOq8i906J/O5p+AqBn77fC1lUAmbQ20zvQC5RBD
	 mUNErNOPPYoW3fL9b6R+6xaFIKhQ1qm4ts/YUNuXRzXqPtbzH0TWJO4tHEIdutUBlOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=GFa0UJ3x;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E779F606A325;
	Mon, 26 Oct 2026 18:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E779F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=GFa0UJ3x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793039785; x=1793644585; i=arc@gmx.li;
	bh=RvWsL8xJkBCO4yxQJRV0O8eJ+YSl1IPaJ9q/D8RQkEI=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GFa0UJ3xjQD+B4cqO1FKHbSUf3VEdAKe8BmtmHbtz4VWptwLgB0ey3skqucsaFKz
	 6B87xFkt2IBrYVQ8gcAkhtEJ6PVV7w6R/brOahT0cb4tTm64YWHMR66529tr3QxyF
	 6BQSgOFlVJsi6/Aw2qfZepAiL+fI1Mv0dA1teNQQAXMqFnnXJwIA2TeHFt4Ke6ePJ
	 s5h8p/1FheIKgWZBo5GfJaW28MilRq71rXmvFgZrU6CMNBy+N3rwlwQsz5pZq9Fce
	 WQo/YZSxIgsLtTnn0VLgGFmk57Ko4Z1X3WN172FRdKiBK6+NAMs5xIsXFvkYUc+SG
	 YBsfRDKGtDstNoVbmQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRTRN-1wy5Hg2eW5-00TS2j; Mon, 26
 Oct 2026 19:36:25 +0100
Date: Mon, 26 Oct 2026 19:36:24 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: Re: [PATCH 0/5] ALSA: usb-audio: Audient iD14 MkI vendor controls
Message-ID: <at-dpPOGs2zD2fuL@khmer.arcnet>
References: <20261019230159.834954-1-mrwillporter@gmail.com>
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
	protocol="application/pgp-signature"; boundary="7KCb+dFSVqdxVtXS"
Content-Disposition: inline
In-Reply-To: <20261019230159.834954-1-mrwillporter@gmail.com>
X-Provags-ID: V03:K1:e/szZTA9Q/6TnsS/Ta8+X7eYqtiU6MNv5CZA8xpviBiMD90bllL
 vXgYXJ9EjG+CXGwV+7wdI0fs2cuY7kzXzGrtP3VonUS0N8V5PnW076c8wTdoLRIL/bQlVE3
 pUSbZXC0keJUzmbHfKhZ4m4RA3daLUU6HnQ2vLTA47VQHT/a0DO247KOZUxQGbL7UhK593U
 0/L5lOtL63bnVPTRFRC2A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jjiRmPTXBCI=;IUkpAEy6Wl0hjPcAz9FEtQ4L2Ci
 yr0TB/KxhFKrNVXv/kHoU4SOr8b1NoJsFMPvrI9nemj8ZpsDtH7qdDV/DsSphSZGHlGDfoLMT
 +KGnOVMmd/573hF0uL07y7yHQLFRWiODmg07c3OWBT99+MyuOSRck8iomn4LsGzkB9PeJMoim
 sGRu+Ffnh1hC8fTpLzifqayfXGqkHLPmrdk2fr5Y1PbU6f+cSb1pBuNf05vE5Wmy18u7HBHta
 /g9rS3yHIw1CzhhY06DQJWU0ys8fuH4L3GPzyVoW2y/e4ngSaM85DeBzyNDD5/NZUquKjCK7b
 JF+LyQoUbdqgwi9VQ7ax10q7a6INUTU1hctIAZdwq+Z2Eq3EUItQPOS3BPNk/XgyYQOrDp3n9
 1dpQZ15dvQHhA8+hImpiA4N9EavffvkPO8x6Op02kFEaE5s+PKaxHKx6L9eO1mI/umma9qKbL
 Gr1GPceRCWHQxg+IyPfIYgWcxJVla2oNmyNEuFNehD+4Y04CRz4m2kEp0hB413ozYhwNmc7pC
 xs3mMhrMIjXzSfaPWHnp5nxZGF0tSwv4Wc3qTAIdjfKkLhTxu3tZhVyeSd3D6PejlD9dfO6ke
 ZMh7FiVsGMqbgbKfoL0vsE14n275gqN23N1YW8CIBi+HnM2W2SkQd3tsu+yIwefu1Sc/SmGQt
 fw6lapVvT2Sl+Znc3jqte/U433HlJy/BJwTb4J2aKB1jPAFcyJIxUt7vHOF3uFJHBj/85qyh3
 IMhwC8+zNhPoRlxBk3siaPnavMo09q9Rr1j80CbbjW2k67Wbir4YP4IBVmiKAsOfQvWZqhLkO
 spPBZwwh0M9lH1Eay8SLCvVEO23HF0xOlj+c0aQIAheWdwU3ZLihms1inJ3UFQ1DGKgn/8NDq
 EcV4IcMQLpRUVPSH1kOvTrVwsR7HLWdDcMOAja2lZWxgN9lrZ70P86MaHGEIuz9uhblkwSKLO
 8yQjILksi1EyHDLPOkulhqQqO1l532WpMKUxpRkDiDbwkLrfJTgmkjcCAmBdxixuBap7mEpik
 JXv7VJz6a4Ejg9rmzqLmMERkQ6SymwRSt/ypNNjEvJdtaIbVTN3Wj6KEI6kqxkmU7Q5NWcbAv
 0FcLaIPI5yavbAWyd5csvMe2Og9mRH1b8y1ILiVhcOedgpqRz3kWmUydK6YEitACCaxzRnCYh
 KOuRXXlM527cjVoj1YXAc0qgOBunIcCDvQzV15vDDSDt7AtzSGoT9sHNl8qsfKnDGqF7ZFHwi
 oHs9Hao1PhERzsgDCRyl4f2iRX7hpuURryvQUBHFYe9boGx3MqMuS5+GGn9kytBWVxA+Lm7S8
 f3QTtZcXPG29Eo7DuMABm6hT8jOlNxr7XqOTDpRiSnT0SPXHfNi1qrmXzeNdUgE+d9DvUw6eZ
 K19hh9Tp3r7iSgLBA78qr3r1AkPX3GSQ5Xa5J2zwxdSOOASakO53KXXXg7caC3vOXSfKq6YyH
 2WLt+0veoo18rnqRHmj//cXdSRDu6Zb64LzeSjQ6uAsT7GEZdCEy1fQTqjkTiW8NeloSsQjgJ
 shc/3kL5TpqqGxoy1q6Zb4/2qt+05LcsxMH5Rc4V871T8p5O9FCi93zuQTa7lj0lUTl66g68q
 Ik8HWMvpPKCv8/yUoe5b90HFY3A0a69yrtfexCeMJazQlIYnet9nR1SW7Y86ZaS6IXVceJ5rr
 CxzdO2eY+H1jg4rkYuRO1k93UKu9PG6528Ek0fPKIyVn8ROGtBjnoxjiL464Em04DT4eC40Fk
 z1g7I+SnGJEqrbTa3aUEBgFbvmumVnT16HiIT+mBJOvj0DiygzWrIjakw/83YxTebrGhb+dmN
 59Wt5gajE/wXaMajNSehPEokiW0ym5GDp4t8PLLFmFVQMt0Hj+dCseVX/5sNilRHTBA8K1AxH
 hKXX5jVmTUmKGXehSafs/pghu50/cgkrkRNi6H3xtHwFQba1Y3VCsxrp0ya2F+XEBYUtxkfEc
 10LAqlwW++AUoUPj7LRpdZ8XZV75VH80A06+aWckhWz+dHJj/zItzmpvuuVaEjtTX2ELnM6UX
 VJiVYpLFSgRxlsESuzNCnx/emHYR/cTUQKdjUBzhjaVRyTY1jU/iW21VYbVyDVMSWNEd0cIE7
 5GtC+P5c9+RWuCzGIZJmwn0z2JKIH1SmeeqPEhqIiSwDILrsiPcGhe8zfUUCmkqP+3D/zpZCg
 Ef10b8hvJAS2rGabjsUhFnahZ0mioFMlaJY9KHfFPSnZyNnovndSPqf+cNKh6aW/xRBo0NIGn
 qUCvtvBLo8PbEUx1CO+Le+oZijTRqi4sURUkqauvdAna3heBq4v/qsSpQ8dH0dfIsBlCJku9S
 +eb4K5kDgTBRRuUowixTspfGHJnPwh9XCpY4mmoHvxrbt7IYbZiRnkQla9lwDw+TyECQ5a/dI
 OHzgokCkqG2op3+fqcdv6P9qxeb7dTw0gKbqTLVZckysAPyhJLXGKMjivEwE+GdEBIjqz3azf
 XFiqht1d1uIMET5MD900kyrhbkWMPvs0rMbhtoOI1TZzLW2lGSRecRoPtuakLkY8i/3Q7WUOZ
 bliN2Cbs8zIRrYV/IiXstVGmuKUa0VQsu1USORWgA296tFrCbU3exXqKyuHnj877F8MqzMHm9
 IdLDToITNNiJS2C5MniDCsHhmweIWWvA9cA+IS0ko04eRzJDc/4A1fY+c2Z5Wzvofy0XM+E6e
 nna7q5AyP1dV/NmxbnNVj3Sb0keVDB75GwegM0zEb/rULLW3G+jjgjD75IF9rrehshJME7kd2
 QPL0+wsVGMxGRv7qZZj6Zr7/GzuFaNdd7AaPeCwS0x2Y1Q6ndXRsHUzlMu7991LiY39wQaYu9
 vobMtzTYtFrUgn3tJQIXso7uGXtTZrpEpnjn0bchJ8tVNcla1YFSqYkffJSs6SRZWy3LkqnZw
 2M97kgdBhxOhh/8rQuXtz6lN0HevDa42qTS5yLEsISuIP4FgcSfcTq4eFzO1eACQz3nZVqwdU
 E8M1/oRWFIW3wQ+SoJvpKU9J7QLeHCbFknciZvtKa/KzC1ueaeUD7EJLe2J+XCJrE987iCR4y
 cAUfQcNwntUNM0iXnTzjYndKVQw9G4NfFKMK12Ki4Exoluq8uTRDJROMFufClzhN1CVGC2kWH
 jWYbm7a7kXO6wQbExTKcSDDbbts3fPECjtonrBhYDgpJT9h9ucLR5R1rQiTRtwwipC7Zocj/6
 fn+swjdgPAnA/AuhsLhKMMx0HCJDs6LYC3IXR/xeh/uiFfAnYDttRh0IvJ8R/bPPcieJz1T/q
 l0KH662yhkTbnHpT6eRhzJUlkXvT+xohGJ5Vqg1WglkcgsV321wep7KHz3kn5icLSpV23ijR8
 twp+XuubQnS8uTnnZTabaoeF2dU2hfMscBvRc087zWcfvqaIOkApWGJtLeqSXJ68oB+SygQ68
 AeJXCkticDT80MgpZFDx/kR65wgUszFLQX6y7eImQxgL+t+AgjcmPpMzz8pYsV3KJE5vCg1B6
 pu90NarUh7IwdDPqOi2SdbE9jHolCgajLZWx3+2+CCtQ4gps+5FwFQ9UVCt7X/YeRtrafhn3z
 BZ8yEbKh781swqQfjeFSwZVa+Spd/1e5LANMxa1W0u8LbDC3S23ZXNvjkGHu+F+q5td2vislW
 a+kYinOXloJV6gVrg+BFCz5mgz1CvVXSOeseaizMmsZ81c+BZrmt4S+LVLZnGYSoGAUSnvMPi
 YeQRiwzclnaL5F4gx8ZVYu+2l7QKphEIugUAEUnIYyovRbtfG5Q42vSxF1a2kbXOyWVt2yBhG
 AeEoNbeO+VyKrARGJxcECYj2Zw2ThMQz+Mc+Apxqa59OmRWRmaa9zh+DmMFl0QnLmsEA96chK
 zZDteTUYnmtsr3yI4GgBoJBub8CBIrQ/Fue3wlhIG/rmc3sHcjjfITtVHIku3Ebz4SMPynSSj
 6TbfC2662Y6aa4yG7qzkI4bM3cS/JkLrsF695AM4ChGWDDb17HyayIwl+nAo6o+WdLxOOS+nj
 AQduSLNDqceSxjHUZWh4bxCTQ5EMYV6ShsB1pMPQUtnJeKoMVwPuG3rMzPePOk6xLdB/x+y52
 lx/tAP4awlHRZp8BKYN0pkpb3gitXtqKEjuY7f4K+80chJamxvzNKMw6vM1RTmXR2ds2Dgdil
 4QELJutsQ8qcVAW85LEQf0YhBCB7b8r2PymCp9xxVnRqox8njKaJF4sNJD56Q+mu/+Tf2bq4C
 +A3sYDUUNCxyMgiV8Oew2BO9q7f+RX85JP5feOQADwctLTw2JdSZg7SVI4wgOJgcavl1ZW1VV
 9SIr5BBhIOgMq+u71Ow6oE3tQQGAVwbbmVrxvADxAvpjOC8yr9nX0stI0aQ2xwAbbr90DLmTg
 2k7pYP4uUqrlgcvosZQVe4AcGbDEn/ONns/aSR7BBu2CxHHIe2Vlz9jY3DM4v/hddCWXV4u6R
 57zHbGjMSALuW9eeqz75K0LAq49XP6wpLWqh9qWau47pDX4YK6YV/OM9lnL3KoMWnsagXosUx
 MnJme/z47ReXOwimgjFH3TAdRw1QFDk2RrUnrdLs4xuLQ+MkvEJUK1npK0O0k4HfEFPFk4xTq
 V+V/OakS+1UYmRxdqNbwvGpNkoiKVLcKMqEL3GX+LeSjYWNz2axTaxwYPWWpQ+p/mCKrrYP+g
 /G2G4J53cu5a+EqcY65wRST69srDaTN2xrgqrJhVzuplfNiKx3y3hMz97jAJNKVhKmbKBIfa8
 ubclnZZaE39JKzTpb/UHcLUgoPqtAeBanGF2yPXshUCZ+ZWj13rIlGZTsHLkQac7OgqrAJHd3
 SOR+XK4JrrXj5g8GmeeBi8WAiZfObN9PrnAQRxh48Ts9oD87dgEU5CZgbXhtJ6Xbc40KIyK7D
 bSFQvHvZua4mqe3Z46dOlHy85oSGI7XfGNbdLr8UhYkwRUpRQI/IIt7p2fWG10Sl/to/OHdyK
 1+usfQwVB3fIKDP0BozgbeEMuMteEYPoFibGLoxCvWh1pPsOjhyJ0uClADQ4TB8yzYMF5hm4F
 yZBSNI3eRrHSdFr5gtxaKIL+qEmbIk7brXBQjyoM6oX+wGCV19rCeVQrsDhfljzW9kkn1kKqI
 QRAtieZ7is6l+YqitNm9m1Qwiwb2eX85UfkkES9J82RIWWQh8Lk1IlD888QxgxoHRgyqNLBFJ
 DSJ8vGzJIibvZ6Zsn9wqeJpgaShudmOrMtMjaj8kMfo++gKKNFOxDsDp1mt+8nkEi6nnKDrrJ
 v03obHonr336lrgyySQyVtwNxlz/ueHC6t8O9wk8bW98wLcuXo9KtpVChpdJFDcK5Kc7p79/U
 lOs3LtjzzWUEbw9nViZAdw2wgGVfKUkR9xU59hYo/DbxRZ6/XhGtQ61UQqFYD9eqPM0LJ/xYW
 9AL3G4qQtMYKhDp8XRfr0N5U5Uf+/GhNC+vovxBhhhWLOHnaR7qm80sYgIl/fcB9UJ4fWStJ6
 2j1qpCayKFMi2+v1WJJg0eOZ2acFpl0EQffHCgevqqVMhyNgcHA9XyAVrVWQPU5fWVH1ASQgs
 Ruv7W7+OB6QdNdxoLUXpDrhGCLpkoo8xwwBAoTHTLTio1552Ul6WMyMzJsQAvr7OZuyAYCRN0
 EPvYZ+QnDZNPF2AXV2YPn4ZPLzzgblb36DclMisi80ZN6RiPUugmK2S5mxg9uElUR1HizskIm
 lGxZlt8ThzHlan9xHDcI9Xmw/PhhlURc9VYMUJYTHEwCT3kJ+OBdlSGe3vkImGrAnJuIH2ejf
 SrHkjS8cH8+ZsQz6D9iPE6MusA05CYuY1syfkEu8KzVd59WH2NnH+OM4DAELY93RUEcb5V4fB
 aXTajX3K+e09eNNuJZZmUqLISK9RMSM76eJMIGr409dDSiszuVrd3NKNldWIBwJppfDa1sp0t
 zazFJvtzTVcwzKuRbDeovDUYu8YjGJbKseDH8aJRcAxXYPAvGPq2nn3u65o6YjFRf+2OMYEtV
 e5sNeng5mDPXvVXFNFHYBvduFPNSVFTDz7mGXl9EpTgjZ0fRVIjGtCD7wnSOeNZYJWrukoNc2
 HzUjP8zNp0PolFSj6G0iHcWn056Iex94Wf8fcsZ8nkG5k3xYvKNuQZ1W/cfw6jdzZ+qqcnNk5
 HD0N3hBk+LVW4luDo/oCoVak8dPQBVVF3GEm3eJEz+xL9nsZ3F9nT/dPIFZXQDJFP9eNZmShI
 XfjEKTVeee6y7AfYwcxT1OwUCsfPmNO2NKAr6CcdsTWFJ6aFqdkHmkkLlEB0Wo4mqPr6w6ASP
 sci9ju8pFKFSOLAbPUf0AXhhRRwAYXI8chF7K0NEzjH/x6ObBK2Ptde3DEilTT+j+zs/NeASK
 dIPgVPl8LSfBl7yGDdz9ugIoEF4E2C8IbdKvzuh+Vm5kkoFykqMftOrqmmUBa9E2v7wG/z1ht
 2g0MFs3thW/9adM/yEWV2SeS51XAvxiCcXciAjV2X9qIOL0Jio1Oy9UfHt3LwvVeIQAiEQQWO
 lSIuugoryyMGPVxF3p6hYR+dWLDIwcrP9bNVzX4NPTfkRSTt4JKpNttW/rgEslbZ6ySpdpnng
 sQbeWsW0KHaryWBjK0cIoo3l3LlwH9/HcvvLxfhMxvc6v8mZclU2jbKyHmUqX6eBYkXf1tNcO
 CMgGybhJqePS4R6Mic7v4ZXfJP0X4xx2d818q0RTWsQJ7r7U5r8gcqtXTD3whwSnuNHvCBuXu
 /EnAB8JYARYQtddjBLX1Heo3PYekN/7cguMYwHtWJ9ynvo8Z+6RLwzPjAeChG+KqA/kzNS1Ub
 apIc245gf5lfVUSx+BvXjsMigHv2RwhRkVdqzGJzaIdsrCTDuvYBgqiqbSvyMQJsYZsBQnniJ
 JI/3bNH2k6E2VPpSFTvblxA9ehIpJwQVxDB/6web7PT1oEkuKoska1SMdnjiwB3Xv9UP2JWif
 TMgH0s3OhYldmi92v6gEur6zA7+AnEcjPM4Phj+ps0XwBO82v1y3+jaXkEbd27XV9dO9iH5LE
 l8R83jMfY3DPTAALuYnw93VkFejYiu3OLFx9fbX0Si7rpXN2Qh7QyE0rXLC5tPy3oU7wPVkA1
 tBJ3RSxnhAv8dC7m/fXh++a5PTCmGxMv5/fJICTNT0h+q5dETrZx5sD8nKojasukOUg1h3ZlA
 uRUcOB1ePNGslSp8b9CdHNgSV6mrhR8/VwuOxWmblR2iunr7MmcQPp7quqbDeNLmKEmsK3AtJ
 uxYrkJG6pRA88RVIE3U40geDcYUousvCW2vq1OfgXjnFv+2M2bVCuAIYx0TN/0R6EbCRfdoS4
 eTNoVBI4Fa91tD9dO2nLIrxGo/q/IV8bopLr9A6EnQxlCN3YAOosEpkqqmdKP4Znwjkps6x4E
 g2vK+sNhz2nEHdAnJNZG0C1+Q/U46UQFe/hhHdNPNrLM6m2HAf6SQtc5ZZaRyUrd4MZMsrXo0
 9Ox7RdJ+SL4hb7p1G0xnO3aA7AC3CcJdxK+NyNjgVe42sDV+mzWphhV1u8=

--7KCb+dFSVqdxVtXS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Will,

On Mon, Oct 19, 2026 at 06:01:54PM -0500, Will Porter wrote:
> [...]
>=20
> sound for-next also has mixer_evo.c for the Audient EVO 4 (2708:0006).
> EVO and iD are separate Audient product lines. The iD14 MkI uses other
> units and a larger control set: a monitor controller, output routing, a
> 14 x 4 mixer and write-only controls. So this series keeps the iD line
> in its own file.
>=20
> [...]

I took a look at this question and it seems like we can share the majority
of code in the EVO driver by complementing it with the following features:
- variable width read/write
- caching of write-only values
- enum data type

Most of these changes should be trivial as the EVO driver controls are
also structured in tabular form and the driver was intended from the start
to be extensible to the evo8 and possibly other hardware. See below diff
for an example of how to support the first point (just to illustrate these
changes are minor, others should be of similar extent, not properly tested
so use with caution).

Adding those features should allow to simply add a new table (allocated at
probe time for WO caching) with entries for most id14 controls. The only
part which seems more problematic is probably FU12 which looks like it
requires some custom logic and would still need actual code.

Happy to support a common driver activity and rename everything to audient
if you think this makes sense in order to reduce code size but no problem
if you think this is too complex to manage, up to you.

  Christian

diff --git a/sound/usb/mixer_evo.c b/sound/usb/mixer_evo.c
index c327b82c8d2d..92f3c6d108a9 100644
--- a/sound/usb/mixer_evo.c
+++ b/sound/usb/mixer_evo.c
@@ -31,9 +31,13 @@ enum snd_evo_type {
 	SND_EVO_TYPE_NCTYPES
 };
=20
+#define SND_EVO_CTRL_FLAGS_SIGNED (1L<<0)
+#define SND_EVO_CTRL_FLAGS_INVERT (1L<<1)
+
 static const struct snd_evo_ctrl_type {
 	snd_ctl_elem_type_t type;
-	bool invert;
+	unsigned long width;
+	unsigned long flags;
 	union {
 		int integer;
 	} min;
@@ -45,6 +49,7 @@ static const struct snd_evo_ctrl_type {
 } snd_evo_ctypes[SND_EVO_TYPE_NCTYPES] =3D {
 	[SND_EVO_TYPE_MONITOR] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_INTEGER,
+		.width =3D 2,
 		.min.integer =3D 0,
 		.max.integer =3D 127,
 		.wValue =3D 0x0000,
@@ -52,7 +57,7 @@ static const struct snd_evo_ctrl_type {
 	},
 	[SND_EVO_TYPE_PHANTOM] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN,
-		.invert =3D false,
+		.width =3D 4,
 		.min.integer =3D 0,
 		.max.integer =3D 1,
 		.wValue =3D 0x0000,
@@ -60,7 +65,8 @@ static const struct snd_evo_ctrl_type {
 	},
 	[SND_EVO_TYPE_MUTE] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN,
-		.invert =3D true,
+		.width =3D 4,
+		.flags =3D SND_EVO_CTRL_FLAGS_INVERT,
 		.min.integer =3D 0,
 		.max.integer =3D 1,
 		.wValue =3D 0x0200,
@@ -68,7 +74,8 @@ static const struct snd_evo_ctrl_type {
 	},
 	[SND_EVO_TYPE_MUTE_OUT] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN,
-		.invert =3D true,
+		.width =3D 4,
+		.flags =3D SND_EVO_CTRL_FLAGS_INVERT,
 		.min.integer =3D 0,
 		.max.integer =3D 1,
 		.wValue =3D 0x0100,
@@ -76,6 +83,8 @@ static const struct snd_evo_ctrl_type {
 	},
 	[SND_EVO_TYPE_MIXER] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_INTEGER,
+		.width =3D 2,
+		.flags =3D SND_EVO_CTRL_FLAGS_SIGNED,
 		.min.integer =3D -128 * 256,
 		.max.integer =3D 6 * 256,
 		.wValue =3D 0x0100,
@@ -280,24 +289,24 @@ static int snd_ctl_evo_boolean_get(struct snd_kcontro=
l *kctl,
 	int i;
=20
 	for (i =3D 0; i < hwchan; i++) {
-		u32 buf;
+		u32 buf =3D 0;
 		int ret;
=20
 		ret =3D snd_evo_get_cur(mixer, value + i, index,
-				      &buf, sizeof(buf));
+				      &buf, ctype->width);
 		if (ret < 0)
 			return ret;
=20
 		ctl_val->value.integer.value[i] =3D le32_to_cpu(buf) ? 1 : 0;
=20
-		if (ctype->invert)
+		if (ctype->flags & SND_EVO_CTRL_FLAGS_INVERT)
 			ctl_val->value.integer.value[i] ^=3D 0x1;
 	}
=20
 	for (; i < nchan; i++)
-		ctl_val->value.integer.value[i] =3D ctype->invert
-							? ctype->max.integer
-							: ctype->min.integer;
+		ctl_val->value.integer.value[i]
+				=3D (ctype->flags & SND_EVO_CTRL_FLAGS_INVERT)
+				  ? ctype->max.integer : ctype->min.integer;
=20
 	return 0;
 }
@@ -317,15 +326,15 @@ static int snd_ctl_evo_boolean_set(struct snd_kcontro=
l *kctl,
 	int i;
=20
 	for (i =3D 0; i < hwchan; i++) {
-		u32 rbuf;
+		u32 rbuf =3D 0;
 		u32 buf =3D cpu_to_le32(ctl_val->value.integer.value[i] ? 1 : 0);
 		int ret;
=20
-		if (ctype->invert)
+		if (ctype->flags & SND_EVO_CTRL_FLAGS_INVERT)
 			buf ^=3D 0x1;
=20
 		ret =3D snd_evo_get_cur(mixer, value + i, index,
-				      &rbuf, sizeof(rbuf));
+				      &rbuf, ctype->width);
 		if (ret < 0)
 			return ret;
=20
@@ -333,7 +342,7 @@ static int snd_ctl_evo_boolean_set(struct snd_kcontrol =
*kctl,
 			changed =3D 1;
=20
 			ret =3D snd_evo_set_cur(mixer, value + i, index,
-					      &buf, sizeof(buf));
+					      &buf, ctype->width);
 			if (ret < 0)
 				return ret;
 		}
@@ -342,6 +351,19 @@ static int snd_ctl_evo_boolean_set(struct snd_kcontrol=
 *kctl,
 	return changed;
 }
=20
+static inline long buf2cpu(const struct snd_evo_ctrl_type *const ctype, u3=
2 in)
+{
+	const u32 u =3D le32_to_cpu(in);
+
+	if  (ctype->flags & SND_EVO_CTRL_FLAGS_SIGNED) {
+		const int sh =3D 32 - ctype->width * 8;
+		const s32 s =3D u << sh;
+
+		return s >> sh;
+	} else
+		return u;
+}
+
 static int snd_ctl_evo_integer_get(struct snd_kcontrol *kctl,
 				   struct snd_ctl_elem_value *ctl_val)
 {
@@ -357,16 +379,16 @@ static int snd_ctl_evo_integer_get(struct snd_kcontro=
l *kctl,
 	int i;
=20
 	for (i =3D 0; i < hwchan; i++) {
-		u16 buf;
-		s16 val;
+		u32 buf =3D 0;
+		s32 val;
 		int ret;
=20
 		ret =3D snd_evo_get_cur(mixer, value + i, index,
-				      &buf, sizeof(buf));
+				      &buf, ctype->width);
 		if (ret < 0)
 			return ret;
=20
-		val =3D le16_to_cpu(buf);
+		val =3D buf2cpu(ctype, buf);
 		ctl_val->value.integer.value[i] =3D val;
 	}
=20
@@ -391,16 +413,16 @@ static int snd_ctl_evo_integer_set(struct snd_kcontro=
l *kctl,
 	int i;
=20
 	for (i =3D 0; i < hwchan; i++) {
-		s16 rbuf;
-		s16 buf =3D cpu_to_le16(ctl_val->value.integer.value[i]);
+		s32 rbuf =3D 0;
+		s32 buf =3D cpu_to_le32(ctl_val->value.integer.value[i]);
 		int ret;
=20
 		ret =3D snd_evo_get_cur(mixer, value + i, index,
-				      &rbuf, sizeof(rbuf));
+				      &rbuf, ctype->width);
 		if (ret < 0)
 			return ret;
=20
-		if (rbuf !=3D buf) {
+		if (buf2cpu(ctype, rbuf) !=3D ctl_val->value.integer.value[i]) {
 			changed =3D 1;
=20
 			ret =3D snd_evo_set_cur(mixer, value + i, index,

--7KCb+dFSVqdxVtXS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJPBAEBCAA5FiEERJIhlnXw6qCYHrZhFHbxepdfWHsFAmrfnaQbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEBR28XqXX1h7xyQQAJvldxy1GPlnVPf8vD49
i+35NQ+Z5ZvEXwCo4vDHZmCmJEeYxnv2UZEXHtPJHF9dWA0gsk1OFnMEKrybq5/u
TRq5vRd15vcphFo2U9YlE06Mq27l1YEyopaSduvyvEeR3W80DSfP2rVgeYFyrQzh
gIJ4SYFvEu4/Z8N648DoT9qKcs6Hapq8RgNzJ8gJraz/Zy+POh6neqcKTpPD+5T9
Zop+F/xdC710MYvy53P21qkVVDHXkOWltb/sgk7fGJil1Zvz1b5QLX7/EBL+uNpf
lcaPZnxd8Wes18ThwVOzFpwN9s5FNKm/rfYZjniAyCUrMIS8LsyfihgON3TWKTcT
cvYzccl7dKx9syogPsRMzvD/8T7TQyfHIRbOK/B94x1Or1LwswTDVk95g1bbeInQ
jYE4Xof191GvesU+R/LfB5BrHdFnntua8cM+jUihdH+MY84nL9Rw/saRiuviU+77
2A3QQQoEMpLIYT3byE4MLGwNTxRP2lG0Bz7G/Sajvv32pjdOCp8ALRTQfNo2mjZi
eaREJIQx/8nuKv213o4Ofk7y4CIg2fzFCirvymLkHc8HhG5xZcBWG4BtBSSIRyen
4uLobJ30z0a9BA8/MM2/lBF6Oe3Tr3U87rB0Sq6HfxsN9ZepKnquDkj10lIEvbVo
Qo8df5WAJLlHJmxPeROxUxm2
=SzTv
-----END PGP SIGNATURE-----

--7KCb+dFSVqdxVtXS--
