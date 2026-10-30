Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380997;
	b=CrjvHIScfFc0GmOFJ8/VGiXaGjpZIjkQLmZRRUd1TvWRjWG+bXJJYSbI55kVMx3PrgJW
	 +vRWQs4rxsLdz0IjPVwqQw76d0HDR1fcpuDVQ2VCPkm92Y2KnaBOrzSZhW3MVpmFTi7UA
	 DzcpGtu2bslUli4oZGRUy1y5amvy0cFb+cRCloaaLnnqhUsAANhERi388M4PzCIaf2g2d
	 1/Mzwk/VHJIVCJvp6pfXGUeWl++DeBfkXQCBlNpZLp15ot68LUqVjYzf8nz1keg2FK3NH
	 qptYpQzXPC3dYpfQR4RYE5oCoOy4ohWv+AcEuCfmIGpultRnLqYFjZyElH72z+/GHlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380997;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4z5JAklJrvo1303QNYfoXGciHX4XJyi04CZmnfUtquM=;
	b=sMe//4jY9SToNaqwabnUR+kdQVN5IKCEQFugDV6/wUop0dWIYpP+m15tGsliKbm+IQjB
	 kizKZcPE7D4yOZDCnHf21nryPmsZhlkDyTcEGd1699jaebp5/jb9KTX7xy4HEpu5ANM7f
	 X9bUMeGAr3j4cx2JTEcp1cVNWZHxYutiR7e+R44hVLXLeFk6SQ9QujOeP4cp9LzmiZFU+
	 Vcm608KIsWr9T6PiNnHEsi3BOzwUbLNLuSk/Kqjwww6kzmiJ1yVpmJn0HMJ8QIf7uN7eK
	 D/HuiTqg/p3QFZCKpxj3SgsNQHYTE0QxNp7l5oYAHFsebFWR7b5V9R/FKhbs1tA3jWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X4NijrBi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27076606A31A;
	Fri, 30 Oct 2026 17:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X4NijrBi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 837001F000C1;
	Fri, 30 Oct 2026 17:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793380996;
	bh=4z5JAklJrvo1303QNYfoXGciHX4XJyi04CZmnfUtquM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X4NijrBisou92DbEBLtCyZ8BxBXD8xyDR+GNceOSpLzygk3L5wd8LjmqSx3k1jwrR
	 tjMkqXIFaw0H56Glyb1aOcvm+tahZk29qCufbnzewsgHn+iUj/ZMi3zp3sDhQWSEQu
	 W4OcgysJq4Va8WDyLFklF4DbwndFpJWTXjnwBAh3ZeCc+NCnhA9Bsxh/Mu5r95rRnO
	 b0P39fpLCRjJaYZxYdcZwMZ3b/mWDCjVNW6waWmCutComLRiu4Cnob7UnaaKCHJtHC
	 bBpK22uIRbOGXkLMVadcbRMNWgwKGQU8fOxGyIQH+/+TG3Y+PXfc+oHEsC4ENEJH00
	 HlroBdzYliomQ==
Date: Fri, 30 Oct 2026 12:23:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Conor Dooley <conor+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: add Everest ES7202
Message-ID: <179338099193.780805.16929156272414901653.robh@kernel.org>
References: <20261021124552.767218-1-jerrysteve1101@gmail.com>
 <20261021124552.767218-2-jerrysteve1101@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021124552.767218-2-jerrysteve1101@gmail.com>


On Wed, 21 Oct 2026 20:45:47 +0800, Jun Yan wrote:
> Add the device-tree bindings for the Everest ES7202, a 2-channel PDM
> analog-to-digital converter controlled over I2C.
> 
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  .../bindings/sound/everest,es7202.yaml        | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/everest,es7202.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

