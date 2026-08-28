Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A348377A83
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933268; cv=pass; b=mqiTBlz2uN/FBeIrdASVuUzHS9/Di/15wAXp8OeCdl76TjdsN6fC4Zhh14BU2rRl0dfyA4s6lCCy8kD43r5iuAEdKn7xZEhkGGPogc138v9f2R9hjMGU1WNQ9Erny1NED8vt67enGtBmtXBXwwCzNU2+4yHMnhcUYWouigvmYjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933268; c=relaxed/simple;
	bh=2x+UF8n18sT4+9jyjBtfMLA3LNRKOdoX1PP1AnaWW3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=txzDTyuwGkuVlZDuAtI0sYe2sTDCJgx4wJr6mhobwMkMYCbVme1+cBPr+y7348yB0EV/YYjDnS27vKH5dLEtmVPLIHgzulcBolF/GgoQTJVbHIDbOcrf+808csiVIhCzFf/n6V2hRolBJYRMBvicAAloZq5OQBeiZx5WWewGF1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com; spf=pass smtp.mailfrom=divinehawk.com; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=divinehawk.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a156627e22so4210597a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:07:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787933265; cv=none;
        d=google.com; s=arc-20260327;
        b=kONF08GIhm0c+DbIYNUSJkbZ2/6hhBjelHL3ygEK1U6tFeYcpQ1YalSVJbKUh29KpK
         8hxJn0yZoMAARk8P32RrTXedub2jYLmBq4F1D5Vi09YJf7ZxgjTctHbnmU4rrE9/KB6+
         h6Uv/6UJKZLHHDrcuyoBs/VNsjYnsXjnN0s99/z+uEspfgRIEyKQ5h6LTsLB2DbKnzvc
         grofIZj+BLVZnn7/eNYhb1S0IfysiKxxvri0/XRAvSVXEB0Z2vCbkMdXoi0RjJKIKG/u
         tlCWE/rswVMGxUTtjAjXJEV1yI9V+eBIlZd44fj2grfeWX5yg77Hnquu3GxuQWVbd3TW
         eVnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=/sRHrsFM0ReOg77NeIRd8xGTZ74lCBqKLjN6+GHojJo=;
        fh=ykDL7zAIzDQtZWYbUEAEGHeCWqGkEr1tfaeqlNs0Gek=;
        b=IzXhoQYfJAbiUo5Vpk870micX2JPXwTJRVywIFFMqqjIpWO+XOA3N4i59HVJQ4vcED
         RQdehEgc5g4bYA/wWZp7fOFNsnN1f3l4SUIK5hAUfW5dVxwGTl8WP4lU2JiiNtCREWG7
         joqrBVFI/H0JGWfL7WKTXD9t/RCUqPTVnLwvmJ6z6z5lLZg01zOKRuxDq+hnqFN5yxbq
         I/dBm7KZq9BE5dCOoKukb5Wacq5fTFP/pyp5q6887nXa1sT1kHLdQJUadtCr83GqTJuM
         oc1pTC1DcOyD5yJA15AgbTDFwpia/ewlHc0IOdH35NBPmqQnZKDsdASzPyegLLys+mmK
         k4og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933265; x=1788538065;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/sRHrsFM0ReOg77NeIRd8xGTZ74lCBqKLjN6+GHojJo=;
        b=h2vz67Q2zl4xtxTrJfgdWBBmzKQAMZEZetzUqGibuWvqrXvNnBqT+vqK3ul2812VFa
         P8i6WBVCB5qkU6cvkYaNDmWF7FU8bIdLpK6j7wRV8vARJPkeWnfdCAB5fJCGS0QVtT9h
         gy589090FhZ59PW8bWoY+uhfa+MDzIdoxkEAAK/3Ts/wa61fqzc9x0UqYqL6iK6LKkRg
         pIXfwRqEsI1pDuWTjJ3uV7Tyxxk5Kj6dOCvR70NibZqJVkA3TC3Yi+loHti0DmtdR8DN
         nmb1ZTCIctL5nImVzusrJv9FaqU6Z/2rkYS8h1ek0egVENImapE6FKdAVQMB2dBv7qyl
         qZtg==
X-Forwarded-Encrypted: i=1; AHgh+RrdTRP9FMkWUcRDDLCteRJ4iZBFLM5zL4pZ0XD7WvWvl8A/OQD4R2Pqp3GikmF7yg2MQ5l3cEsFaR/Kfw8=@vger.kernel.org
X-Gm-Message-State: AFuF++mn32i0SZn22S7h4uGwFsDxTOBjR9BmlG1oXCA6HJMGES4XBa7R
	bpPclsxMw0LwkwrVWbcJo8DoOAVQm+nHTXnD82n3jufCJBuGirGIJ18CryFI6Ut/+g2vEXWH66P
	jlwSJKJz9Fw9kUN9eEos2tqZB8pBUTfh/ooiZyVLQ
X-Gm-Gg: AR+sD11vFnDOehIrTTloWy/rcjTNQErErkjcACwQTArZiaj1bQgX7RvkxLEFA+IZRxf
	jJhvyNiu/VF0upJu1Lee39MxL618XvvI+ahqrwR9cvPeHe6jS6VeZS4lLS/sG1m0xzCryZ1TGL9
	xKsOdF/NhCqmocUx84pNBLOaz5knNOB1VPBeARN0yzuOMdW4eR/rfUpNl971JdL24RglBAgwMEP
	x/EhcwjXmHS1LKk4P31VBvY7Qj2dZ29ZghB61QwJYSoDyMIDTqpwKeZ+EEN0J5u0P7aJsjGX3mg
	Kj4oT5e12ZZntQq4ChhIGplp9tEOTp98ur5QDkD4tvhnywL8eSCgUr2q0PJ+uteql601lWBMmcS
	oa/g=
X-Received: by 2002:a17:907:3d44:b0:c25:5faf:b216 with SMTP id
 a640c23a62f3a-c256dbc488dmr75904866b.4.1787933264392; Fri, 28 Aug 2026
 09:07:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-xhci-no-soft-retry-v1-0-b9c264b56601@divinehawk.com>
 <20260828-xhci-no-soft-retry-v1-1-b9c264b56601@divinehawk.com>
 <1aa6d82a-0d35-45a4-9ebd-1c3d8929e611@kernel.org> <CABUBpLfsjscV1-ftUPjKbL4EYq-9NSHYSCGJ_vqStM7k4FtkdA@mail.gmail.com>
 <14fd70cb-d07a-456f-9800-d3ece4039529@kernel.org>
In-Reply-To: <14fd70cb-d07a-456f-9800-d3ece4039529@kernel.org>
From: Matt Eaton <linux@divinehawk.com>
Date: Fri, 28 Aug 2026 18:07:32 +0200
X-Gm-Features: AcwNN1X_eUImfA2GusjfdVKVq99gGElh74I2ER8bxKyHTDCnL8d6gf7e81RmkvY
Message-ID: <CABUBpLfH+bi3Q5hD+WWG0QnyCfmQMRt9TkUN+zC1pvH44ez90w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: xhci: add xhci-no-soft-retry-quirk
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 3:53=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 28/08/2026 15:18, Matt Eaton wrote:
> > On Fri, Aug 28, 2026 at 2:39=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 28/08/2026 14:37, Matt Eaton via B4 Relay wrote:
> >>> From: Matt Eaton <linux@divinehawk.com>
> >>>
> >>> Document the xhci-no-soft-retry-quirk property, added in the
> >>> following patch.
> >>>
> >>> snps,dwc3-common.yaml refs usb-xhci.yaml for every dr_mode other than
> >>> peripheral, so a host-mode dwc3 node inherits it and dt_binding_check
> >>> accepts it there.
> >>
> >> I do not understand how this sentence is relevant. Please describe the
> >> hardware needing this.
> >
> > I came across this while porting the UniFi Travel Router (IPQ4018),
> > the stock Qualcomm kernel is 4.4.60 which predates the soft retry
> > code. The command ring hangs if you disconnect the device while it's
> > transmitting. Reproducible consistently when using USB to tether to a
> > phone.
> >
> >>>
> >>> Signed-off-by: Matt Eaton <linux@divinehawk.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
> >>>  1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Do=
cumentation/devicetree/bindings/usb/usb-xhci.yaml
> >>> index 4238ae896ef6..5d67a41658f7 100644
> >>> --- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> >>> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> >>> @@ -25,6 +25,10 @@ properties:
> >>>      description: Set if the controller has broken port disable mecha=
nism
> >>>      type: boolean
> >>>
> >>> +  xhci-no-soft-retry-quirk:
> >>> +    description: Set if the controller cannot perform xHCI Soft Retr=
y correctly
> >>
> >> Why isn't this implied by compatible? Looks like controller's property=
.
> >
> > The xhci device is created by dwc3 core as a child device, and so
> > xhci_plat_probe() is used. I think a DT property is the right
> > approach, similar to quirk-broken-port-ped, but to set
> > XHCI_NO_SOFT_RETRY.
>
> Linux driver behavior should not matter here. DT property for telling
> Linux what to do is not the right approach. As I said, it's implied by
> compatible unless you bring hardware reasons why it is not. Driver
> reasons don't matter.

Will rework without DT property. Appreciate the feedback!

Best,
Matt
