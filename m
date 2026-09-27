Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6332B2E2663
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790535854; cv=none; b=IfmmZ/K+EfQmk+aQ5GzY/XPORjfOlleZxoW6yMQTZNYbhiObmAv6d47NwtGHep9PyBhLcb8V1A6SlW4XPOOjthONS+GUu8vp5eXnr1LtuzqD82J/PArrtJWLrOVgKdozjlQ42pRx+dP4arXhAGr4cT/8XKdo6lLKRdq024Wic9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790535854; c=relaxed/simple;
	bh=yq+S0AbSl2UI12SIHVJJwICC+aRs4uj4+vY9r0176yU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ge0KkBBpuTtLtUanIoes6Cy+AoTYAyesC9AYotZ9GpublOWc0fVY6H5j0WWX+QwMMLWBxzRLLyiDBO7YH94HbY7m188EBN2kguED7cZI8sJNrD6Y9RUntgvOXbiFwML6p1evKdiJhqchJPYkl2mkuCKPWG24UxGmtExjqfEOobI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oHY6Yl3/; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oHY6Yl3/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso16710475e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790535850; x=1791140650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=umhd/YnLBvK6LYK33eda6TbzJ1O+p1LrIpceO44vyfk=;
        b=oHY6Yl3/+uylUbRCu9OqlnXbjJ6kusyb55VWLgverHzvwLIoOgRy1off5r+VjQFUWX
         fw14N4Y+JEDBuKP7qCcdYogdKHRJyEeJAnmh3S1J+EOh8jEmKZN/KWZ4ygKpx/ctmazu
         vbSEgDHjYmjtQ5lOnvBQ330B6G4O2TO2Y9URy1NfWO6JR5h/Bim2331nBIur/+MtRohJ
         cO6XqC/slkW/pse5qtPoZmTT3WDTrkL7UH7mvvLwI6/h21VT90GZgepRngfJAIeJoZ6p
         mxCDVfjEOnG3cflMI6rnybettz7lTsuabe/uL1ZvFOrsz40y5tRLW5R+oyWrJAvmfa8b
         6PhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790535850; x=1791140650;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=umhd/YnLBvK6LYK33eda6TbzJ1O+p1LrIpceO44vyfk=;
        b=JT6fjhflAAyEuI8WkmK5KVy+dlVEeEGZaxMCSSkXandqZlxzl5ARNK7tSam4NnWVC6
         htdMeoIvb7TpB9S4IwtnCTZzwAYchfJ4CFkZ5G70syrRyfdIXxx/9zsTVHdw6NTcobtn
         fs56y8xIIsH91NsTyy2jmcP9r2OLwA0/URqgdg6uTJ8pWTXv2zym0i3UifW6pu0J/ZLl
         7oQXGwm6uBY1gtJc1Cr0QYi7SEiW9RzO5XSEI2ISc2tpeTFx3yP/30ywKDRYPwCljWRL
         SQ24ihyfohV1iPWGYtTp2yUwVYLfg6b1Xi6NYqxUwabnfHJVf+3wSmq4Hb74UZEKCrfW
         54JQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkbhsGymjeJ10JHQoH6jU31oqG0Dw7kFIsTpbIb7HQ/8QemNFzhicIZKEyBrA3iVsqIS3DqEEL8aDZHNM=@vger.kernel.org
X-Gm-Message-State: AFuF++mpnZDLjyf7EdV5hpqPYSOdMpRra0A79fVYLxPYIvDAFVM43jib
	jEhS69rW+sjTowg8u3RCczKphG/qT9EA1pz/ECTDgFpyoTaJpj78A8RI
X-Gm-Gg: AYBFou2jSfU5O/GSf/tmxLJSM/tWaqwvDqCgEPXq9xMztJHBzXfM77liB/vihAKkVXd
	AMBIYy0lWpPAG3wbEEp6uMLFYp9cI0NX0vs+G/Zp09kfQz25TfjNMwQUKE93xZQGk7pV74oaj/C
	pHBaSXOvxHP5hmw/d0ydmX2RCcJbRm2HHCX+IaSiEtw4zKbTDLy1CbB6nb1xhBJnuR2AuQ4NCO6
	WO+1mWHotZXj6T5VGbRVrrAhrO6cFHSnhVGcL5T3jwboXE7XPoSu2rsAi+ZMG3WxJ1YHZ2AwZdm
	IV2tHpgI0QkmSEir+0DNnQEJ6RPtJ68kl3RGhsmUpXV9ruSZ2XAj9tMJLV8lCrtQJ2NGkWBbfhn
	FdcCWTY6PrEldjo7F80sNhvDt0w/MHiUl4YQtusRCxH68oVpESQ8I1ToWZaqLizuif5acFQ0jyD
	kwqUPATti6LO6m1p3z7zBZYmkiQ9G0FybgtXlC6n37vuG0NzaTgmPRgzx7tF6WHl+9xjyJvUAnS
	hhk/XMC4vaf6QS4p+89xGZJC5aEDt0sRFHqlH3AV45uaVe0tA==
X-Received: by 2002:a05:600c:3b9b:b0:4a0:149:d894 with SMTP id 5b1f17b1804b1-4a001708718mr43801235e9.26.1790535850321;
        Sun, 27 Sep 2026 12:04:10 -0700 (PDT)
Received: from ?IPV6:2a07:7e87:3bf2:0:1388:ec72:45b6:c87e? ([2a07:7e87:3bf2:0:1388:ec72:45b6:c87e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a00178ff7bsm106564935e9.12.2026.09.27.12.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 12:04:10 -0700 (PDT)
Message-ID: <48e56ed1-d8ef-4d26-8c18-9bb0fa2e5a7a@gmail.com>
Date: Sun, 27 Sep 2026 21:04:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] usb: typec: ucsi: Acer Aspire 16 AI reports connector 2
 while num_connectors=1
From: Carlo D'Ambrosio <carlo.dambrosio@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <18c22d05-af53-4d94-b6ff-91441adc65c2@gmail.com>
Content-Language: en-PH
In-Reply-To: <18c22d05-af53-4d94-b6ff-91441adc65c2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

I did one additional A/B trace which seems to explain why the 
notification storm persists.

Starting from a clean Windows -> Fedora boot, I traced 
|ucsi_notify_common()|and |ucsi_acpi_async_control()|and connected the 
charger to the lower USB-C port, which behaves normally.

The first event was:

|NOTIFY CCI=0x20000002 connector=1 num_connectors=1 CONTROL 
command=0x0000000000010012|

|0x12|is |UCSI_GET_CONNECTOR_STATUS|, with connector 1 encoded in the 
command.

This was followed by:

|NOTIFY CCI=0x80000900 CONTROL command=0x0000000000030004 NOTIFY 
CCI=0x20000000|

 From |ucsi.h|, |0x04|is |UCSI_ACK_CC_CI|, bit 16 is 
|UCSI_ACK_CONNECTOR_CHANGE|, and bit 17 is |UCSI_ACK_COMMAND_COMPLETE|. 
Therefore |0x00030004|is:

|ACK_CC_CI | ACK_CONNECTOR_CHANGE | ACK_COMMAND_COMPLETE|

So for the valid connector-1 notification, Linux performs the expected 
|GET_CONNECTOR_STATUS(1)|and subsequently acknowledges the connector change.

In contrast, when the upper USB-C port triggers the problem, the trace 
is only:

|NOTIFY CCI=0x20000004 connector=2 num_connectors=1 NOTIFY 
CCI=0x20000004 connector=2 num_connectors=1 ...|

approximately every 570 ms, with *no calls at all to 
|ucsi_acpi_async_control()|*during the loop.

This matches |ucsi_notify_common()|: because connector 2 is greater than 
|ucsi->cap.num_connectors|(1), |ucsi_connector_change()|is not called, 
so the normal connector-change handling/acknowledgement path is never 
entered.

Also, to correct an interpretation I was considering earlier: 
|0x20000004|is *ACK_COMPLETE + connector 2*, not ERROR + connector 2 
(|UCSI_CCI_ACK_COMPLETE|is bit 29; |UCSI_CCI_ERROR|is bit 30).

This seems to leave two separate questions:

 1. Why does the PPM expose |num_connectors=1|via GET_CAPABILITY while
    the upper physical USB-C port generates connector-change indicator 2?
 2. Independently, should Linux do anything to acknowledge/drop an
    out-of-range connector-change notification to prevent a persistent
    notification storm, or is the current behavior intentional?

I can run further traces/tests if useful.

Thank you.

Regards,


Carlo D'Ambrosio


Il 27/09/26 18:34, Carlo D'Ambrosio ha scritto:
> Hello,
>
> I am seeing a reproducible UCSI issue on an Acer Aspire 16 AI running 
> Fedora 44.
>
> System:
> - Acer Aspire 16 AI
> - BIOS 1.22 (latest available from Acer)
> - Fedora 44
> - Linux 7.2.7-200.fc44.x86_64
> - Dual boot with Windows 11
> - Two physical USB-C ports on the left side of the laptop; the upper 
> one is Thunderbolt-capable
>
> The problem occurs when I connect either a USB device or the original 
> Acer charger to the upper USB-C/Thunderbolt port.
>
> Immediately after connecting it, the kernel log starts being flooded 
> with:
>
>   ucsi_acpi USBC000:00: bogus connector number in CCI: 2
>
> The messages continue after disconnecting the device and also survive 
> a normal Fedora reboot.
>
> The lower USB-C port does not trigger the problem.
>
> The condition can be cleared in either of these ways:
>
> 1. Power off and perform an EC reset by holding the power button for 
> about 30 seconds.
> 2. Boot Windows 11 and then reboot into Fedora.
>
> Interestingly, Windows itself does not appear to trigger the problem. 
> After Windows -> Fedora, Fedora starts cleanly again until something 
> is connected to the affected upper USB-C port.
>
> Reloading ucsi_acpi does not clear the underlying condition:
>
>   modprobe -r ucsi_acpi
>   modprobe ucsi_acpi
>
> Removing the module stops the log messages, but after loading it again 
> the flooding resumes.
>
> In a clean Fedora boot (after Windows -> Fedora, with nothing 
> connected) I get:
>
>   typec port0: bound usb3-port1 (ops connector_ops)
>   typec port0: bound usb2-port1 (ops connector_ops)
>   typec port0: bound usb4_port1 (ops connector_ops [thunderbolt])
>   ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-70)
>   ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-70)
>
> There is no "bogus connector number" flooding at this point.
>
> Also, /sys/class/typec contains only port0.
>
> I used bpftrace to inspect the UCSI state directly.
>
> While the failure is active, tracing ucsi_acpi_read_cci() shows:
>
>   ret=0  CCI=0x20000004
>
> repeatedly.
>
> I also traced ucsi_notify_common() while reading the UCSI capability 
> stored by the kernel:
>
>   CCI=0x20000004  num_connectors=1
>
> This repeats continuously.
>
> I then reproduced the issue starting from a known-clean Fedora boot. 
> Before connecting anything there were no such notifications. I started 
> the ucsi_notify_common() probe and connected the original Acer charger 
> to the affected upper USB-C port.
>
> The very first notification observed was already:
>
>   CCI=0x20000004  num_connectors=1
>
> and it then repeated continuously.
>
> The bpftrace probe used was:
>
>   kfunc:ucsi_notify_common
>   {
>       printf("CCI=0x%08x  num_connectors=%u\n",
>              args.cci,
>              args.ucsi->cap.num_connectors);
>   }
>
> I separately traced ucsi_acpi_read_cci() with:
>
>   kfunc:ucsi_acpi_read_cci
>   {
>       @cci[tid] = args.cci;
>   }
>
>   kretfunc:ucsi_acpi_read_cci
>   /@cci[tid]/
>   {
>       $p = @cci[tid];
>
>       printf("ret=%d  CCI=0x%08x\n",
>              retval,
>              *(uint32 *)$p);
>
>       delete(@cci[tid]);
>   }
>
> This indicates that 0x20000004 is already being returned through the 
> ACPI UCSI path; it is not a connector number subsequently generated by 
> the typec_ucsi bounds check.
>
> I also verified:
>
>   ucsi->cap.num_connectors = 1
>
> using BTF/bpftrace.
>
> Finally, I inspected the Fedora typec_ucsi module corresponding to the 
> running 7.2.7 kernel. In ucsi_init(), the code calls ucsi_reset_ppm() 
> and subsequently obtains the capability data into ucsi->cap. The 
> num_connectors field being used by the core is therefore 1 when the 
> connector-2 CCI notifications are received.
>
> So the state visible to Linux appears to be:
>
>   UCSI capability:
>       num_connectors = 1
>
>   after using upper USB-C port:
>       CCI = 0x20000004
>       connector change = 2
>
> which results in:
>
>   bogus connector number in CCI: 2
>
> I am aware of the earlier UCSI issue where connector notifications 
> could arrive before num_connectors had been initialized, resulting in 
> num_connectors == 0. This does not appear to be the same case: 
> num_connectors is already initialized to 1 here, and the problem can 
> be triggered reproducibly after the system is fully booted.
>
> The fact that booting Windows clears the persistent condition is also 
> interesting, although I do not know what initialization/reset sequence 
> Windows performs and I do not want to infer the root cause from that 
> alone.
>
> Could you advise whether this looks like an Acer UCSI/PPM firmware 
> inconsistency, or whether something in the Linux UCSI/ACPI 
> initialization could cause the second physical USB-C port to generate 
> connector-2 notifications while GET_CAPABILITY exposes only one 
> connector?
>
> I can provide additional bpftrace output, ACPI tables, full dmesg, or 
> run additional tests if useful.
>
> Regards,
>
>
> Carlo D'Ambrosio
