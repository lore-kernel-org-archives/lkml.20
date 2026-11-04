Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782894;
	b=13NrkX0JhJ3wRnvxZTS6DaYbjRdwgJ6mGVurstXCIxF4aYlTomulXAdaSCunpcUo22Dq
	 zfZ7uFSAfWfiqfXFh7uk3pz4RckQii8Pyxedzzm8kv9DWfgsYW9YXnfYhmkRCheWcRPfC
	 1PSErfvgVlIi+DiCmDOxvLy3vbiI+fST8d1HHqoavxVmymcnc3b1lULZo4pYgM0fqVHQY
	 7L06F90gObKvDhv+VV6j5V3N6qZRYjBhFIPp/5Rqj6z4HBhGMRcq3lvWMPl5wJ70jpVyp
	 pNIjUUlgbt+qP6Y4NmTznJji9RqXcVvb87CZzCjU28vLnxqplUVQPY/xD0d6k3fxBZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782894;
	h=DMARC-Filter:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=C6wcb+7zbg4WCt6Ir989ES5F2Km1kGXwhQCTmFUdnG0=;
	b=msO/D4YFtw/07u7FxxVx0j4IaDjylDR+zD8aXc7ZCpN7j+joFC9VmQgB/V4+cpV3LhYb
	 +dJy4fQpo6uXU5Dza5cHoJETnXNAB7SF0lIuDM/k9vxfdsOrsoYLLnZok+TqakUdmfnp6
	 hLuEEC7LhxeOJVt+bsC1tVcv6hLnj2D66nguhH/aPp7rymrWXZdQ20nii6OeuCeqAZ8ca
	 wYsJlUP2RQSjOX1NwpbCRErbzT6aSYjVjG+U3CPYItf6JiQqB9pcqKM4zrnrQFrvu0Jiy
	 KTVZ/RoIsqG8UHCQg9V/9g6ekPVZnFu4gKNJWsNX4Pm5d7zsfC8j/qXHkVHKl5irhuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC83F606A328;
	Wed,  4 Nov 2026 09:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC83F606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.98])
	by APP-01 (Coremail) with SMTP id qwCowAA3YPpe9OpqUE9CAA--.34579S2;
	Wed, 04 Nov 2026 17:01:20 +0800 (CST)
Message-ID: <73fd01b87381e2ed33d52edc4f4bb7ee9ba578d1.camel@iscas.ac.cn>
Subject: Re: [PATCH v4 0/2] phy: add support for TH1520 USB PHY
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam
 <mani@kernel.org>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel	
 <p.zabel@pengutronix.de>, Wei Fu <wefu@redhat.com>, Drew Fustini	
 <dfustini@tenstorrent.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Han Gao
	 <rabenda.cn@gmail.com>
Date: Wed, 04 Nov 2026 17:01:17 +0800
In-Reply-To: <ee28bd16-11fc-4b78-b1ee-e0e20bb0cfdb@kernel.org>
References: <20261103081444.1983071-1-zhengxingda@iscas.ac.cn>
	 <ee28bd16-11fc-4b78-b1ee-e0e20bb0cfdb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:qwCowAA3YPpe9OpqUE9CAA--.34579S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKw4DGw45KFW5Ww1UKFWkXrb_yoWfKrb_u3
	Z8Zr1a9w4Iq3s3AFs8Kr4DWF4DK3yYyw1vvry8Xry3C34jyr4ru34DGw4Fyr15ZFZ8GF1f
	Crn3ZayrW3y7WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsxYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07j8KsUUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-11-04=E4=B8=89=E7=9A=84 09:26 +0100=EF=BC=8CKrzysztof Kozlow=
ski=E5=86=99=E9=81=93=EF=BC=9A
> On 03/11/2026 09:14, Icenowy Zheng wrote:
> > This patchset is split from the "Add TH1520 USB support" patchset,
> > with only the PHY binding/driver part.
> >=20
> > Icenowy Zheng (2):
> > =C2=A0 dt-bindings: phy: add binding for T-Head TH1520 USB PHY
> > =C2=A0 phy: add a driver for T-Head TH1520 USB PHY
>=20
>=20
> Considering how vulab@iscas.ac.cn=C2=A0is ignoring reviews/comments and
> spams
> with a lot of unthreaded emails, completely disregarding any tries of
> contact over last 1.5 months, shall we ignore all contributions from
> @iscas.ac.cn?
>=20
> Maybe this will be the only way to actually be heard?
>=20
> Icenowy, do you have any possibility to reach to bot spammers from
> vulab?

Unfortunately as I am not in Beijing, I am not able to physically reach
the persons; I have reported this incident to my supervisor and I am
also feeling quite bad on this.

Thanks,
Icenowy

>=20
> Best regards,
> Krzysztof

