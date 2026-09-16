Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41934B2CA0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789582535; cv=none; b=r7C0v7FCKbp6M3rKbIf8S3xwhXsxGX7yDzvdtqP8LQltVfZ9ofJWBtBJN43xJuHFYcsSs4nS140rMCYED+OK6Pp+ZZqGt9wdzbpWkJiyQ+ecSolYfNK91mcrYBviYor+7FZ5hzatfIFD3WLP1IsvRWfu6A5sTPYFFq9cR3GsxBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789582535; c=relaxed/simple;
	bh=dSCqGgYRwdYm3xNWISQSdyfDzLRDfEZdXIIMlDmoWSU=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=pCbB7k27OoHSI7X0v677fJ/SEeD4fDVdRGNjWoW+LYCJUAa4I+nbEK8w21+P0PEXHyhfZ/0wiVr10v6+9nY6sdR4PaQHq11v1YKxc2Hjo+B5pTBnULbfz0RuDvAHez8cVQwI8Gyncxhsm1e9wUwwG//xKQZijMC29gPIgXb90ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EWmNkSM9; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EWmNkSM9"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so211615e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789582523; x=1790187323; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FYx9isMMr8aF+/2UYelOTScXJOAkcODXeEKi0uXPtyk=;
        b=EWmNkSM90lG/CZsoKQvEyrmQSsrXwqRT+2h9sYtdUVm1/gEGXnYQFIEbSQZLol4BQO
         3kHHwWhbcxl68Xcvooi2wP56DlePHZsCfNQpweyOQI9TYlRqNo5hjshZuoKWBbHYryMO
         Dikrq8LiSxJt6yfHHDPuSVow+IpcpXhcHmk8NTJpZCgCu8laQgbiOWkRqDzt0zmz3Wkj
         t/f7cX+pVhfNH1hD3Vf5QRlAQ6Iwt3hw8Ru8gaWiJPNYbAdLad+87bMOsqDmBQCsCwYo
         tqe3YbGCQ9q3cwVG2pzsjChi+enLDFhTUw37vqrBtd4DbrLwdzwWaGPgKx63cv2M0KkQ
         5ChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789582523; x=1790187323;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FYx9isMMr8aF+/2UYelOTScXJOAkcODXeEKi0uXPtyk=;
        b=vAF62nyWcNhGH5uugdouh16BSDVk8nlR4rVaOx39hKxes3uSvQbiNG5jvcgpOSabX9
         r7lhodTV9AQFa2aQMs+KKVQE4HSXkCWnqYnH1lpTnyQJYZnW9ztsZMM8/i/HK+5Df/oM
         lG9WP3Pew7F3vvPvRz28fVoxy1UHnxr3fx0xESjoV+9UdicqSBKjDIsusCbIr10mhQfw
         Dy1zFENDpxWaWqoCIEWhuW0JE5TcHi/9f1Vepl8120aF+suS/UV/hSstaBn0l3drL/Qt
         JhKNtjkJAS5J98SxQLL8+7+JGsUQMuMGouepH1HQMzyYJmZmXEtly2p5F4U93G2FRdux
         EVOA==
X-Forwarded-Encrypted: i=1; AKwUvBxHHDbnEhJSgYrk4Yj5gnVrMUN19WChYXUykR1nemb11XwrXMIwm4R++p+EdoNwkWfQbjxBja7Tq87ikLo=@vger.kernel.org
X-Gm-Message-State: AFuF++l/lH3LoYnc5yk4DnG215Ugwv44oyrVGMhVHebcVEvB8cePzDL3
	L9ovSjCLW1WbrunB+II+F+ISA4ZcyOScaUj7yjG0IxNYyUX00ngcAjWuPf+IldXbbnI=
X-Gm-Gg: AYBFou2X5gj8MMqlwAsPSZrH270cbu4PbNezHjqN7mVJF2cjfTtjXBQKLRmaYEmqYs+
	Mnw1lp64s5VemosOsp9s8eYFk3lBVfVZu28q2iWUkLeDCH3nJx2B7PYdC802lZllBq8r47pXdoe
	8JpUiGXyXE4HkpEL+bkeZaPnCMeg6EssrIiOKbhPF8EG6SX+s4BeREaXroB43AjVP1N5yW+ThIk
	tJV/VC4Y5SXbgTn5EieWkACzRRGhFI2UJYxo96WcvylzFrAeSPMPGZ1+Lz2EFaYFMF2XvByHjrJ
	FtN/FTDn68bDdifDT18plcG4TRdVR5+TUba7++4FPrdLdnbIuR+X3sXoB5zdENoHFrIvznm8bdn
	7f8gjtJ3R3bc0X6acvcOHSLo0HAeFZ9ebYtKNNXWG+VQvmVLO+lkpXmcbWhcENNyVkBDoB2caWL
	laUNaYMXBfRga5c+YX502EMOPWGC6amQ7HjxFW8iYQy1kODPAELZ8r6zJDGN555iCMd2C9JcdK+
	JoS29dWviFgeCN1KjDeRzHg3GnweL3aCS7BNAtF+g==
X-Received: by 2002:a05:600c:4505:b0:49c:fc6e:8cae with SMTP id 5b1f17b1804b1-49eb73475efmr44858405e9.18.1789582522693;
        Wed, 16 Sep 2026 11:15:22 -0700 (PDT)
Received: from ?IPV6:2a02:3035:b61:cd4c:428e:991d:75b:c0b0? ([2a02:3035:b61:cd4c:428e:991d:75b:c0b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd32c5e1sm15131045e9.5.2026.09.16.11.15.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 11:15:21 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------XEnvVPO2Q6hJ7Mw5RBTj5USZ"
Message-ID: <9e4b67a2-1975-43a6-b79f-00ad833c4214@suse.com>
Date: Wed, 16 Sep 2026 20:15:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] usb: mdc800: possible circular locking dependency between
 io_lock and minor_rwsem
To: CJ <firefly0158@163.com>, gregkh@linuxfoundation.org, oneukum@suse.com,
 n7l8m4@u.northwestern.edu, kees@kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <5c30f641.6b79.1a09ed8b2bf.Coremail.firefly0158@163.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <5c30f641.6b79.1a09ed8b2bf.Coremail.firefly0158@163.com>

This is a multi-part message in MIME format.
--------------XEnvVPO2Q6hJ7Mw5RBTj5USZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14.09.26 09:36, CJ wrote:
> 
> Hi,
> 
> 
> I am reporting a lockdep-detected circular locking dependency in the mdc800 USB
> driver, triggered by a syzkaller USB reproducer.  The issue is reproducible with
> HEAD commit cee9395acd8043be0644b25c34bfa86623f2b935 (v7.3-rc1, Linux
> 7.3.0-rc1).
> 
> 
> The reproducer connects a synthetic USB device through dummy_hcd that enumerates
> as the mdc800 camera, then opens the character device node.  No filesystem or
> image input is involved; the trigger is the connect-then-open sequence on a
> device that binds to this driver.

Hi,

please try the attached patch.

	Regards
		Oliver

--------------XEnvVPO2Q6hJ7Mw5RBTj5USZ
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usb-misc-mdc800-avoid-circular-locking.patch"
Content-Disposition: attachment;
 filename="0001-usb-misc-mdc800-avoid-circular-locking.patch"
Content-Transfer-Encoding: base64

RnJvbSAwMWU0YTViN2YyMTViNWY2OWVjMWZkZGU4MjljMWNkMDk0OThhMjJmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29t
PgpEYXRlOiBXZWQsIDE2IFNlcCAyMDI2IDE3OjM3OjI1ICswMjAwClN1YmplY3Q6IFtQQVRD
SF0gdXNiOiBtaXNjOiBtZGM4MDA6IGF2b2lkIGNpcmN1bGFyIGxvY2tpbmcKCk5vIG5lZWQg
Zm9yIGxvY2tpbmcgaW4gcHJvYmUoKQoKU2lnbmVkLW9mZi1ieTogT2xpdmVyIE5ldWt1bSA8
b25ldWt1bUBzdXNlLmNvbT4KLS0tCiBkcml2ZXJzL3VzYi9pbWFnZS9tZGM4MDAuYyB8IDI2
ICsrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspLCAxNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9pbWFn
ZS9tZGM4MDAuYyBiL2RyaXZlcnMvdXNiL2ltYWdlL21kYzgwMC5jCmluZGV4IGY3Y2FhMWM1
Y2JiNy4uOWVkZjBhZmU4ZGFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL3VzYi9pbWFnZS9tZGM4
MDAuYworKysgYi9kcml2ZXJzL3VzYi9pbWFnZS9tZGM4MDAuYwpAQCAtNDgwLDE1ICs0ODAs
NiBAQCBzdGF0aWMgaW50IG1kYzgwMF91c2JfcHJvYmUgKHN0cnVjdCB1c2JfaW50ZXJmYWNl
ICppbnRmLAogCiAJZGV2X2luZm8oJmludGYtPmRldiwgIkZvdW5kIE11c3RlayBNREM4MDAg
b24gVVNCLlxuIik7CiAKLQltdXRleF9sb2NrKCZtZGM4MDAtPmlvX2xvY2spOwotCi0JcmV0
dmFsID0gdXNiX3JlZ2lzdGVyX2RldihpbnRmLCAmbWRjODAwX2NsYXNzKTsKLQlpZiAocmV0
dmFsKSB7Ci0JCWRldl9lcnIoJmludGYtPmRldiwgIk5vdCBhYmxlIHRvIGdldCBhIG1pbm9y
IGZvciB0aGlzIGRldmljZS5cbiIpOwotCQltdXRleF91bmxvY2soJm1kYzgwMC0+aW9fbG9j
ayk7Ci0JCXJldHVybiAtRU5PREVWOwotCX0KLQogCW1kYzgwMC0+ZGV2PWRldjsKIAltZGM4
MDAtPm9wZW49MDsKIApAQCAtNTI2LDcgKzUxNywxMSBAQCBzdGF0aWMgaW50IG1kYzgwMF91
c2JfcHJvYmUgKHN0cnVjdCB1c2JfaW50ZXJmYWNlICppbnRmLAogCiAJbWRjODAwLT5zdGF0
ZT1SRUFEWTsKIAotCW11dGV4X3VubG9jaygmbWRjODAwLT5pb19sb2NrKTsKKwlyZXR2YWwg
PSB1c2JfcmVnaXN0ZXJfZGV2KGludGYsICZtZGM4MDBfY2xhc3MpOworCWlmIChyZXR2YWwp
IHsKKwkJZGV2X2VycigmaW50Zi0+ZGV2LCAiTm90IGFibGUgdG8gZ2V0IGEgbWlub3IgZm9y
IHRoaXMgZGV2aWNlLlxuIik7CisJCXJldHVybiAtRU5PREVWOworCX0KIAkKIAl1c2Jfc2V0
X2ludGZkYXRhKGludGYsIG1kYzgwMCk7CiAJcmV0dXJuIDA7CkBAIC01NDgsMTUgKzU0Mywx
MiBAQCBzdGF0aWMgdm9pZCBtZGM4MDBfdXNiX2Rpc2Nvbm5lY3QgKHN0cnVjdCB1c2JfaW50
ZXJmYWNlICppbnRmKQogCiAJCXVzYl9kZXJlZ2lzdGVyX2RldihpbnRmLCAmbWRjODAwX2Ns
YXNzKTsKIAotCQkvKiBtdXN0IGJlIHVuZGVyIGxvY2sgdG8gbWFrZSBzdXJlIG5vIFVSQgot
CQkgICBpcyBzdWJtaXR0ZWQgYWZ0ZXIgdXNiX2tpbGxfdXJiKCkgKi8KLQkJbXV0ZXhfbG9j
aygmbWRjODAwLT5pb19sb2NrKTsKIAkJbWRjODAwLT5zdGF0ZT1OT1RfQ09OTkVDVEVEOwog
Ci0JCXVzYl9raWxsX3VyYihtZGM4MDAtPmlycV91cmIpOwotCQl1c2Jfa2lsbF91cmIobWRj
ODAwLT53cml0ZV91cmIpOwotCQl1c2Jfa2lsbF91cmIobWRjODAwLT5kb3dubG9hZF91cmIp
OwotCQltdXRleF91bmxvY2soJm1kYzgwMC0+aW9fbG9jayk7CisJCXVzYl9wb2lzb25fdXJi
KG1kYzgwMC0+aXJxX3VyYik7CisJCXVzYl9wb2lzb25fdXJiKG1kYzgwMC0+d3JpdGVfdXJi
KTsKKwkJdXNiX3BvaXNvbl91cmIobWRjODAwLT5kb3dubG9hZF91cmIpOworCiAKIAkJbWRj
ODAwLT5kZXYgPSBOVUxMOwogCQl1c2Jfc2V0X2ludGZkYXRhKGludGYsIE5VTEwpOwotLSAK
Mi41NS4wCgo=

--------------XEnvVPO2Q6hJ7Mw5RBTj5USZ--
